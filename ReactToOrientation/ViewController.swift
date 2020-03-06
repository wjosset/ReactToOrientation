import UIKit

class ViewController: UIViewController {
	
	
	// MARK: - Internal
	
	// MARK: IBOutlets
	
	@IBOutlet var orientationLabel: UILabel!
	@IBOutlet var colorView: UIView!
	
	// MARK: IBActions
	
	@IBAction func didTapOnChangeColorButton() {
		changeColorView()
	}
	
	
	
	
	// MARK: - Override
	
	// MARK: Lifecycle - Standard
	
	override func viewDidLoad() {
		super.viewDidLoad()
		changeTextOfOrientationLabelIfIndicatedStep(step: .viewDidLoad)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		changeTextOfOrientationLabelIfIndicatedStep(step: .viewDidLayoutSubviews)
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		changeTextOfOrientationLabelIfIndicatedStep(step: .viewDidAppear)
	}
	
	
	// MARK: Lifecycle - Related to rotation
	
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
	
	
	
	
	// MARK: - Private
	
	
	// MARK: Properties - Private
	
	// ⚠️Change lifecycleStepsUpdatingLabel to update label at the indicated lifecycle steps
	
	/// Defines all the lifecycle steps that should update the orientation description label
	private let lifecycleStepsUpdatingLabel: [LifeCycleOrientationStep] = [
			.viewDidAppear,
			.traitCollectionDidChange
		]
	
	/// Colors to indicate to the user that the button has been pushed
	private let colors: [UIColor] = [.brown, .cyan, .red, .blue]
	private var colorIndex = 0
	
	/// Interface orientation
	private var windowInterfaceOrientation: UIInterfaceOrientation? {
		return UIApplication.shared.windows.first?.windowScene?.interfaceOrientation
	}
	
	/// Physical device orientation
	private var deviceOrientation: UIDeviceOrientation { UIDevice.current.orientation }
	
	/// Description which describes the current device orientation together with the interface orientation
	private var orientationDescription: String {
		guard let interfaceOrientation = windowInterfaceOrientation else { return "" }
		
		let description =
		"""
		📱Device Orientation:
		Is in portrait mode => \(deviceOrientation.isPortrait ? "✅" : "❌")
		Is in landscape mode => \(deviceOrientation.isLandscape ? "✅" : "❌")
		Is in flat mode => \(deviceOrientation.isFlat ? "✅" : "❌")
		Is in valid orientation => \(deviceOrientation.isValidInterfaceOrientation ? "✅" : "❌")
		
		⬆️Interface Orientation:
		Is in portrait mode => \(interfaceOrientation.isPortrait ? "✅" : "❌")
		Is in landscape mode => \(interfaceOrientation.isLandscape ? "✅" : "❌")
		"""
		
		return description
	}
	
	
	
	// MARK: Methods - Private
	
	private func changeTextOfOrientationLabelIfIndicatedStep(step: LifeCycleOrientationStep) {
		printOrientationDescriptionToConsole(step: step)
		
		if lifecycleStepsUpdatingLabel.contains(step) {
			orientationLabel.text = orientationDescription
		}
	}
	
	private func printOrientationDescriptionToConsole(step: LifeCycleOrientationStep) {
		print()
		print(step.description)
		print(orientationDescription)
		print()
	}
	
	/// Function which change the color view bound in order to trigger viewDidLayoutSubviews()
	private func changeColorView() {
		colorView.backgroundColor = colors[colorIndex % colors.count]
		colorView.frame = .zero
		colorIndex += 1
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
	
	var description: String {
		return "\(self.colorIndicator) \(self)"
	}
	
	private var colorIndicator: String {
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
