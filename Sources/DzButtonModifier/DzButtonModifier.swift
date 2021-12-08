

import Foundation
import SwiftUI

@available(iOS 13.0, *)
public struct DzButtonModifier : ViewModifier {
  var font:Font
  var backgroundColor:Color
  var width:CGFloat
  var height:CGFloat
  var alignment:Alignment
  var cornerRadius:CGFloat
  var foregroundColor:Color
  var overlaylineWidth:CGFloat
  var strokeColor:Color
    
  public  init(font: Font, backgroundColor: Color, width: CGFloat,height:CGFloat,alignment:Alignment,cornerRadius:CGFloat,foregroundColor:Color,overlaylineWidth:CGFloat,strokeColor:Color) {
           self.font = font
           self.backgroundColor = backgroundColor
           self.width = width
           self.height = height
           self.alignment = alignment
           self.cornerRadius = cornerRadius
           self.foregroundColor = foregroundColor
           self.overlaylineWidth = overlaylineWidth
           self.strokeColor = strokeColor

       }
 
public func body(content: Content) -> some View {
    content
      .font(font)
      .frame(width: width, height: height, alignment: alignment)
      .foregroundColor(foregroundColor)
      .background(backgroundColor)
      .cornerRadius(cornerRadius)
      .overlay(RoundedRectangle(cornerRadius: cornerRadius).stroke(strokeColor, lineWidth: overlaylineWidth))

  }
}

@available(iOS 13.0, *)
public  extension View {
@available(iOS 13.0, *)
    func DzButtonModifiers(font: Font,backgroundColor:Color,width:CGFloat,height:CGFloat,alignment:Alignment,cornerRadius:CGFloat,foregroundColor:Color,overlaylineWidth:CGFloat,strokeColor:Color) -> some View {
        
        modifier(DzButtonModifier(font: font, backgroundColor: backgroundColor, width: width, height: height, alignment: alignment, cornerRadius: cornerRadius,foregroundColor: foregroundColor,overlaylineWidth: overlaylineWidth,strokeColor: strokeColor))
    }
}


@available(iOS 13.0, *)
public struct DzButton: View {
    var buttonAction: () -> Void
    var buttonTitle : String
    var font:Font
    var backgroundColor:Color = .blue
    var width:CGFloat
    var height:CGFloat
    var alignment:Alignment = .center
    var cornerRadius:CGFloat = 2
    var foregroundColor:Color = .white
    var overlaylineWidth:CGFloat = 1
    var strokeColor:Color = .white
    
    public  var body: some View {
        Button(action: buttonAction) {
            VStack{
                Text(buttonTitle)
                .DzButtonModifiers(font:font, backgroundColor:backgroundColor,width:width,height:height,alignment:alignment,cornerRadius:cornerRadius,foregroundColor:foregroundColor,overlaylineWidth:overlaylineWidth,strokeColor:strokeColor)
                }
        }
        
    }
}
