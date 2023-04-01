
Procedure.i KeyComInit(PortName.s)
  If OpenSerialPort(0, PortName, 115200, #PB_SerialPort_NoParity, 8, 1, #PB_SerialPort_NoHandshake, 1024, 1024)
    ProcedureReturn 1
  Else
    ProcedureReturn 0
  EndIf
EndProcedure

Procedure.a KeyComCheckKey()
  If Not IsSerialPort(0)
    ProcedureReturn 1
  EndIf
  If AvailableSerialPortInput(0) = 0
    ProcedureReturn 2
  EndIf
  res.a
  ReadSerialPortData(0, @res, 1)
  ProcedureReturn res
EndProcedure

Procedure KeyComHandle()
  KeyAsc = KeyComCheckKey()
  If KeyAsc = 1
    ProcedureReturn 1
  ElseIf KeyAsc = 2
    ProcedureReturn 2
  EndIf
    
  VK.w = VkKeyScan_(KeyAsc) 
  If VK = -1 
    ProcedureReturn 
  EndIf 
  VK & $ff 
  keybd_event_(VK, Scan, Extended, 0) 
;   keybd_event_(VK, Scan, #KEYEVENTF_KEYUP | Extended, 0) 
EndProcedure


OpenConsole()

If Not KeyComInit("COM4")
  MessageRequester("ERROR","")  
EndIf

  
While #True 
  KeyComHandle()
  
Wend

