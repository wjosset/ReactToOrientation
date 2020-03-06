import UIKit

class ViewController: UIViewController {
	@IBOutlet var orientationLabel: UILabel!
	@IBOutlet var colorView: UIView!
	
	// Will trigger viewDidLayoutSubviews()
	@IBAction func didTapOnChangeColorButton() {
		colorView.backgroundColor = colors[colorIndex % colors.count]
		colorView.frame = .zero
		colorIndex += 1
	}

	private let colors: [UIColor] = [.brown, .cyan, .red, .blue]
	
	private var colorIndex = 0
	
	// Change that value to update label at the indicated lifecycle steps
	private let lifecycleStepsUpdatingLabel: [LifeCycleOrientationStep] = [
			.viewDidAppear,
			.traitCollectionDidChange
		]
	
	private var orientation: UIDeviceOrientation { UIDevice.current.orientation }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		changeTextOfOrientationLabelIfIndicatedStep(step: .viewDidLoad)
	}
	
	override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
		super.willTransition(to: newCollection, with: coordinator)
		
		print()
		print("❗️🥳 User has rotated the device!!!")
		print()
		changeTextOfOrientationLabelIfIndicatedStep(step: .willTransitionNewCollection)
	}
	
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		changeTextOfOrientationLabelIfIndicatedStep(step: .willTransitionSize)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		changeTextOfOrientationLabelIfIndicatedStep(step: .traitCollectionDidChange)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		changeTextOfOrientationLabelIfIndicatedStep(step: .viewDidLayoutSubviews)
	}

	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		changeTextOfOrientationLabelIfIndicatedStep(step: .viewDidAppear)
	}
	
	private func changeTextOfOrientationLabelIfIndicatedStep(step: LifeCycleOrientationStep) {
		guard let interfaceOrientation = windowInterfaceOrientation else { return }
		
		print()
		print("\(step.colorIndicator) \(step)")
		
		
		let orientationDescription =
		"""
		📱Device Orientation:
		Is in portrait mode => \(orientation.isPortrait ? "✅" : "❌")
		Is in landscape mode => \(orientation.isLandscape ? "✅" : "❌")
		Is in flat mode => \(orientation.isFlat ? "✅" : "❌")
		Is in valid orientation => \(orientation.isValidInterfaceOrientation ? "✅" : "❌")
		
		⬆️Interface Orientation:
		Is in portrait mode => \(interfaceOrientation.isPortrait ? "✅" : "❌")
		Is in landscape mode => \(interfaceOrientation.isLandscape ? "✅" : "❌")
		"""
		
		print(orientationDescription)
		print()
		
		if lifecycleStepsUpdatingLabel.contains(step) {
			orientationLabel.text = orientationDescription
		}
	}
	
	private var windowInterfaceOrientation: UIInterfaceOrientation? {
		return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
	}
}


enum LifeCycleOrientationStep: String {
	case
	viewDidLoad,
	willTransitionNewCollection,
	willTransitionSize,
	traitCollectionDidChange,
	viewDidLayoutSubviews,
	viewDidAppear
	
	var colorIndicator: String {
		switch self {
		case .viewDidLoad: return "🔵"
		case .willTransitionNewCollection: return "🟣"
		case .willTransitionSize: return "🔴"
		case .traitCollectionDidChange: return "🟠"
		case .viewDidLayoutSubviews: return "🟡"
		case .viewDidAppear: return "🟢"
		}
	}
}
