import Foundation


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
