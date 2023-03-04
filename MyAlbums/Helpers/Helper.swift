//
//  Helper.swift
//  MyAlbums
//
//  Created by Rain Moustfa on 3/4/23.
//

import Foundation
import ProgressHUD

extension ProgressHUD{
    static func showLoader(){
        ProgressHUD.animationType = .singleCirclePulse
        ProgressHUD.colorBackground = .clear
        ProgressHUD.colorHUD = .clear
        ProgressHUD.colorProgress = .blue
        ProgressHUD.colorAnimation = .blue
        ProgressHUD.show()
    }
}
