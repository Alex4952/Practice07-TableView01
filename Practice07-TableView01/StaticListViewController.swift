//
//  StaticListViewController.swift
//  Practice07-TableView01
//
//  Created by Mac on 2015. 11. 7..
//  Copyright © 2015년 Mac. All rights reserved.
//

import UIKit

class StaticListViewController: UITableViewController {

/*
 - command + shift + H, H (H를 연속으로 두번 빠르게 입력하면 앱 종료할 수 있는 화면이 나옴)
 - 이 상태에서 종료하고 싶은 앱을 위로 드래그하면 앱이 종료됨.
	
 데이터 저장시
 - NSUserDefaults (간단한 정보)
 - Core Data
 - SQLite
 - 아카이빙 (게임맵같은 대량 데이터)
*/

	@IBOutlet var name: UIButton!
	@IBOutlet var age: UIButton!
	@IBOutlet var isSingle: UISwitch!
	
	@IBAction func settingName(sender: AnyObject) {
		
		let alert = UIAlertController(title: "항목입력", message: "이름을 입력해주세요", preferredStyle: .Alert)
		
		// ?? 앞의값이 nil일때 "없음" (앞의 값이 닐이더라도 옵셔널이 아님, 안쓰면 nameValue는 옵셔널이됨, 결과적으로 안전하게 옵셔널을 해제)
		let ok = UIAlertAction(title: "확인", style: .Default) { (_) in
			let nameValue = alert.textFields?[0].text ?? "없음"
			self.name.setTitle(nameValue, forState: UIControlState.Normal)
			
			let bundle = NSUserDefaults.standardUserDefaults()
			bundle.setObject(nameValue, forKey: "name")
		}
		
		alert.addTextFieldWithConfigurationHandler() {
				tf in
				tf.placeholder = "이름"
		}
		
		alert.addAction(ok)
		self.presentViewController(alert, animated: false, completion: nil)
		
	}
	
	@IBAction func settingAge(sender: AnyObject) {

		let alert = UIAlertController(title: "항목입력", message: "나이를 입력해주세요", preferredStyle: .Alert)
		
		let ok = UIAlertAction(title: "확인", style: .Default) { (_) in
			let ageValue = alert.textFields?[0].text ?? "0"
			self.age.setTitle(ageValue, forState: UIControlState.Normal)

			let bundle = NSUserDefaults.standardUserDefaults()
			bundle.setObject(ageValue, forKey: "age")
		}
		
		alert.addTextFieldWithConfigurationHandler() {
//			tf in
//			tf.placeholder = "나이"
//			tf.keyboardType = UIKeyboardType.DecimalPad
			$0.placeholder = "나이"
			$0.keyboardType = UIKeyboardType.DecimalPad
		}
		
		alert.addAction(ok)
		self.presentViewController(alert, animated: false, completion: nil)
		
	}
	
	@IBAction func settingSingle(sender: AnyObject) {
		let bundle = NSUserDefaults.standardUserDefaults()
		bundle.setBool(self.isSingle.on, forKey: "isSingle")
	}
	
	override func viewDidLoad() {
		let bundle = NSUserDefaults.standardUserDefaults()
		
		if let name = bundle.objectForKey("name") as? String {
			self.name.setTitle(name, forState: UIControlState.Normal)
		}
		
		if let age = bundle.objectForKey("age") as? String {
			self.age.setTitle(age, forState: UIControlState.Normal)
		}
		
		self.isSingle.on = bundle.boolForKey("isSingle")
	}
	
}
