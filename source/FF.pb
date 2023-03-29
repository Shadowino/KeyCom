; h = FindWindow_(0, "PureBasic 6.00 LTS (x64) - FF.pb"); 
; h = FindWindow_(0, "notepad"); 
; Debug h
; h = GetWindow_(h, #GW_CHILD)                          ; 
; h = GetActiveWindow_();

; Debug h
; Debug PostMessage_(h, #WM_KEYDOWN, $46, 0);#VK_SPACE, 0);

Repeat
  ;   h = GetActiveWindow_();
;   h = GetForegroundWindow_();
;   Debug h
;   h = GetWindow_(h, #GW_CHILD)                          ; 
;   Debug h
;   Debug PostMessage_(h, #WM_KEYDOWN, $53, 0);#VK_SPACE, 0);
;   h = FindWindow_(0, "notepad")
;   h = GetForegroundWindow_()
;   Debug h
  keybd_event_(#VK_A, 0, 0, 0)
;   Debug keybd_event_(#VK_A, 0, #KEYEVENTF_KEYUP, 0)
  
;   SendMessage_(h, #WM_KEYDOWN, #VK_A, 0)
  Delay(1000)
Until 0
