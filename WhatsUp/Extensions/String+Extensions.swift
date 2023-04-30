//
//  String+Extensions.swift
//  WhatsUp
//
//  Created by Joy on 2023/04/30.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
