import Foundation

public class MCResult: NSObject, NSCoding {
	open fileprivate(set) var uuid:String = UUID().uuidString

	public override init() {
		super.init()
	}

	required public init(coder decoder:NSCoder){
		self.uuid = decoder.decodeObject(forKey: "uuid") as! String
	}

	open func encode(with coder: NSCoder){
		coder.encode(self.uuid, forKey:"uuid")
	}
}

