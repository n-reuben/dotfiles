
evaluate-commands %sh{

  # special
  fg0="rgb:a2a4b0"
  bg0="rgb:292933"
  hl0="rgb:2e3440"
  hl1="rgb:3b4252"
  # black
  black0="rgb:32323d"
  black1="rgb:40424f"
 
  # red
  red0="rgb:f48fb1"
  red1="rgb:ec4890"
 
  # green
  green0="rgb:1d9c80"
  green1="rgb:43cb8c"
 
  # yellow
  yellow0="rgb:a1efd3"
  yellow1="rgb:fffdaf"
 
  # blue
  blue0="rgb:92b6f4"
  blue1="rgb:87dfeb"
 
  # magenta
  magenta0="rgb:985eff"
  magenta1="rgb:bd99ff"
 
  # cyan
  cyan0="rgb:6dc7b5"
  cyan1="rgb:51e2c2"
 
  # white
  white0="rgb:4d4f5c"
  white1="rgb:c6c6c6"
 
     echo "
        # Code highlighting
        face global value     ${red1}
        face global type      ${yellow0}
        face global variable  ${blue0}
        face global module    ${blue1}
        face global function  ${blue0}
        face global string    ${red1}
        face global keyword   ${yellow1}+b
        face global operator  ${magenta0}
        face global attribute ${magenta1}
        face global comment   ${white0}+a
        face global meta      ${cyan0}
        face global builtin   default+b

        # Markup
        face global title         ${cyan0}+b
        face global header        ${green1}+b
        face global bold          default,default+ba
        face global italic        default,default+ia
        face global underline     default,default+ufa
        face global strikethrough ${red1}
        face global mono          ${white0}
        face global block         ${white1}
        face global link          ${blue2}+u
        face global bullet        ${green1}
        face global list          ${white1}

        face global Default            ${fg0},${bg0}
        face global PrimarySelection   default,${hl0}+g
        face global SecondarySelection default,${hl1}+g
        face global PrimaryCursor      ${bg0},${blue1}+fg
        face global SecondaryCursor    ${bg0},${hl1}+fg
        face global PrimaryCursorEol   ${bg0},${hl1}+fg
        face global SecondaryCursorEol ${bg0},${hl1}+fg
        face global LineNumbers        ${white1}
        face global LineNumberCursor   ${blue1}
        face global LineNumbersWrapped ${blue1}
        face global MenuForeground     ${fg0},${bg0}+b
        face global MenuBackground     default,${black0}
        face global MenuInfo           ${red1}
        face global Information        ${bg0},${magenta1}
        face global Error              ${red1},default+b
        face global StatusLine         ${blue1},${black1}
        face global StatusLineMode     ${yellow1}
        face global StatusLineInfo     ${green1}
        face global StatusLineValue    ${cyan1}
        face global StatusCursor       ${bg0},${fg0}
        face global Prompt             default
        face global MatchingChar       default,${white0}
        face global BufferPadding      ${bg0},${bg0}
        face global Whitespace         ${blue0}+f
        face global WrapMarker         ${red1}+f
    "
}
