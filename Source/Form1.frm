VERSION 5.00
Begin VB.Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   0  'None
   Caption         =   "SpaceRun"
   ClientHeight    =   10785
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   19545
   Icon            =   "Form1.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   10785
   ScaleWidth      =   19545
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '����������
   WindowState     =   2  'Maximized
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000001&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   9735
      Left            =   0
      ScaleHeight     =   10000
      ScaleMode       =   0  'User
      ScaleWidth      =   16995
      TabIndex        =   0
      Top             =   0
      Width           =   17000
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'��ͷ����
Private StartAnimCountTime As Single
Private Sub Form_Load()
If InStr(1, CStr(App.Path), " ") > 0 Then
MsgBox "���󣡾���·�����ܰ����ո�(����·��)����Ȼע���ʧ�ܣ����򼴽��˳���", vbCritical, "·������"
End
End If

  'ûע��� �ø��ļ������
If Dir(App.Path & "\RegMarkE.m") = "" Then
    Shell "regsvr32.EXE " & App.Path & "\TV3D65.DLL", vbNormalFocus
    Open App.Path & "\RegMarkE.m" For Append As #1
    Print #1, "Marked"
    Close #1
End If

If Dir(App.Path & "\RegMarkM.m") = "" Then
    Shell "regsvr32.EXE " & App.Path & "\tvmedia.DLL", vbNormalFocus
    Open App.Path & "\RegMarkM.m" For Append As #1
    Print #1, "Marked"
    Close #1
End If

'����ǵ�һ��������Ϸ�ǾͰ�װ����
Dim AddFontResult As Long
If Dir(App.Path & "\FontMark.m") = "" Then
AddFontResult = AddFontResource(App.Path & "\����������.TTF")
    If AddFontResult <> 0 Then
    MsgBox "����Ӧ�ð�װ�ɹ���"
    Open App.Path & "\FontMark.m" For Append As #2
    Print #2, "Marked"
    Close #2
    End If
End If






Form1.Show

'������Ϊȫ����ô�� TV���صĴ��ڴ�С��ȫ��
Picture1.Width = Form1.Width

Picture1.Height = Form1.Height

f��ʼ��





'///////////////////////////////////////////////////////////
'/////////////////////////////��ѭ��///////////////////////
'////////////////////////////////////////////////////////

Do


DoEvents


Form1.Caption = GameTools.Magnet_Mesh.GetPosition.X & "camx :" & camX  'camX & "   y:" & camY & "   z:" & camZ


Select Case Playlevel


Case 1


TV.Clear

For a = 1 To 4

If Button(a).MouseHasClick = True Then

    Select Case a
    
    Case 1 '��ʼ��Ϸ
    NextPlayLevelToGo = 2
    
    
    Case 2 '�̵�
    NextPlayLevelToGo = 4
    
    Case 3 '����
    NextPlayLevelToGo = 5
    PlayLevelBeforeSetting = 1 '˵���Ǵ�<����>����� '�����Ǵ���Ϸ�н������� Ҳ���������˵�����
    
    Case 4 '�˳�
    NextPlayLevelToGo = 100
    
    
    
    End Select
    
    If NextPlayLevelToGo <> 0 Then GE.FadeOut 500

End If

Next a




    '�ȵ�������feel��
If NextPlayLevelToGo <> 0 And GE.IsFadeFinished = True Then

Playlevel = NextPlayLevelToGo 'NextPlayLevelToGo��֮ǰ�����ú���

    If NextPlayLevelToGo = 2 Then '��Ϸ����
         Picture1.Width = 17000
         Picture1.Height = 10000
         'TVҪ�����豸��С ��Ȼ2D��ͼ������ʲô�Ļ���ƫ��
          TV.ResizeDevice
         'TV���غ����ٰ�������Ϊȫ��
         Picture1.Width = Form1.Width
         Picture1.Height = Form1.Height
         
       MenuBGM.Stop_
    If GameSettings.IsSoundOn = True Then GameBGM(GameBGMID).Play
    End If
         
NextPlayLevelToGo = 0


GE.FadeIn 1000
    
End If


















Case 2 '��Ϸ��
'/////////�����л���ѭ��
KeyCountTime.Key_PageDown = KeyCountTime.Key_PageDown + TV.TimeElapsed

'����һ�� ��  ����PAGEUP����
If (GameBGM(GameBGMID).PlayState = TV_PLAYSTATE_ENDED) Or _
(KeyCountTime.Key_PageDown > 2000 And inputE.IsKeyPressed(TV_KEY_PAGEDOWN) = True) Then
GameBGM(GameBGMID).Stop_
KeyCountTime.Key_PageDown = 0
GameBGMID = GameBGMID + 1
       If GameBGMID > 3 Then
       GameBGMID = 1
       End If
'��Ч���˾Ͳ�����һ��
If GameSettings.IsSoundOn = True Then GameBGM(GameBGMID).Play
End If



TV.Clear

If inputE.IsKeyPressed(TV_KEY_ESCAPE) = True Then
Playlevel = 6 '��ͣ
TV.ResizeDevice
End If


If SE.EventActivated = False Then 'Ϊ����������¼�3 camera��degree


    If CamViewDegree > 60 Then CamViewDegree = CamViewDegree - 0.02 * TV.TimeElapsed


    If CamViewDegree < 63 Then CamViewDegree = 60 '�������¼�3 ������� ���������ͷ�任


    cam.SetViewFrustum CamViewDegree, 7000
    
    
End If



f�ƶ�ϵͳ


�����¼�


�������Ǯ�ܵ�


f�����ܵ� '˳������RMB


'����Ŵ�
SunSize = SunSize + 0.0001 * TV.TimeElapsed


If SunSize < 6 Then atmo.Sun_SetBillboardSize SunSize

'RMB��ת
RMBRotateY = RMBRotateY + 1 * TimePassSpeed


    For r = 1 To 70
    
    
    RMB(r).SetRotation 0, RMBRotateY, 0
    
    
    PickMoneyParticle(r).Update
    
    
    Next r

'��ʯ��
LittleRock.SetGlobalPosition camX + 2000, 150, 500  '����ϵͳ�ĸ���


LittleRock.Update


If TotalCash > 10000000 Then TotalCash = 9999999


f��Ⱦ (1)



If IsDead = True Then '////////////����

If GameScore > HighScore Then HighScore = Int(GameScore)


ShockActivated = True


ShockTimeOnce = 0


ShockTime = 0


cam.SetViewFrustum 60, 7000


GE.Flash 1, 0, 0, 1500


Playlevel = 3


���ݴ浵 (DataType_PlayerData)


End If


















Case 3 '����


TV.Clear


f���� 1000, 10

'////////////////////camera��ʼŲ
camX = camX + 0.5 * TV.TimeElapsed

CamLX = camX + 1000

CamLY = camY - 500

CamLZ = camZ + 1500

If camY < 500 Then camY = camY + 5 * TV.TimeElapsed

If camZ > -1000 Then camZ = camZ - 5 * TV.TimeElapsed

cam.SetCamera camX, camY, camZ, CamLX, CamLY, CamLZ



RMBRotateY = RMBRotateY + 1


    For r = 1 To 70
    
    
    RMB(r).SetRotation 0, RMBRotateY, 0
    
    
    Next r
    
    
f�����ܵ�


LittleRock.SetGlobalPosition camX + 2000, 150, 1000


LittleRock.Update


For i = 1 To 30
ExplosionParticle(i).ResetAll
Next i

f��Ⱦ (1)


'///////////////////////����˵���3����ť
For a = 5 To 7

If Button(a).MouseHasClick = True Then

    Select Case a
    
    Case 5 '���¿�ʼ
    NextPlayLevelToGo = 2
    
    
    Case 6 '�̵�
    NextPlayLevelToGo = 4
    
    
    Case 7 '�������˵�
       NextPlayLevelToGo = 1
    
    End Select
    
    'ÿ��������Ŀ��level֮��Ҫ���
    
    If NextPlayLevelToGo <> 0 Then GE.FadeOut 500


End If

Next a


If NextPlayLevelToGo <> 0 And GE.IsFadeFinished = True Then
Playlevel = NextPlayLevelToGo 'NextPlayLevelToGo��֮ǰ�����ú���
       If NextPlayLevelToGo = 2 Then '��Ϸ����
              Picture1.Width = 17000
              Picture1.Height = 10000
              'TVҪ�����豸��С ��Ȼ2D��ͼ������ʲô�Ļ���ƫ��
              TV.ResizeDevice
              'TV���غ����ٰ�������Ϊȫ��
              Picture1.Width = Form1.Width
              Picture1.Height = Form1.Height
       End If
    
       If NextPlayLevelToGo = 1 Then '����Ϸ�������˵�����
              For i = 1 To 3
              GameBGM(i).Stop_
              Next i
              MenuBGM.Play
       End If
         
NextPlayLevelToGo = 0

���³�ʼ������

GE.FadeIn 500

End If













'//////////////////////////�̵�
'//////////////////////////�̵�
'//////////////////////////�̵�
Case 4

TV.Clear

'����
SCR.Draw_Texture GetTex("ShopBG"), 0, 0, FormWidth, FormHeight

'��ֹһ��������һ��
AfterPressCountTime = AfterPressCountTime + TV.TimeElapsed

For a = 8 To 11

'����0.5���������һ��
If Button(a).MouseStatus = Button_IsClicked Then


    Select Case a
    Case 8 '��Ѫ
        If TotalCash > 3000 And GameTools.HP_InShop_TheNumberPlayerHas <= 9 And _
        AfterPressCountTime > 300 Then
              TotalCash = TotalCash - 3000
              AfterPressCountTime = 0
              GameTools.HP_InShop_TheNumberPlayerHas = GameTools.HP_InShop_TheNumberPlayerHas + 1
              Else
              SCRText.NormalFont_DrawText "�������߹����ˡ�", 500, 560, RGBA(1, 0.6, 0.6, 1), 3
        End If
    
    Case 9 '����ϵͳ
        If TotalCash > 6000 And GameTools.Eject_TheNumberPlayerHas <= 4 And _
        AfterPressCountTime > 300 Then
              TotalCash = TotalCash - 6000
              AfterPressCountTime = 0
              GameTools.Eject_TheNumberPlayerHas = GameTools.Eject_TheNumberPlayerHas + 1
              Else
              SCRText.NormalFont_DrawText "�������߹����ˡ�", 500, 560, RGBA(1, 0.6, 0.6, 1), 3
        End If
        
    Case 10 'Զ�̴�money
        If TotalCash > 4000 And GameTools.MoneySave_TheNumberPlayerHas <= 4 And _
        AfterPressCountTime > 300 Then
              TotalCash = TotalCash - 4000
              AfterPressCountTime = 0
              GameTools.MoneySave_TheNumberPlayerHas = GameTools.MoneySave_TheNumberPlayerHas + 1
              Else
              SCRText.NormalFont_DrawText "�������߹����ˡ�", 500, 560, RGBA(1, 0.6, 0.6, 1), 3
        End If
        
    
    Case 11 '�������˵�
    '//////BGM�л�
    If GameSettings.IsSoundOn = True Then
    MenuBGM.Play
    GameBGM(GameBGMID).Stop_
    End If
    
    NextPlayLevelToGo = 1
    ���ݴ浵 (DataType_PlayerData)
    GE.FadeOut 500
       
    
    End Select

End If

Next a



If NextPlayLevelToGo <> 0 And GE.IsFadeFinished = True Then

Playlevel = NextPlayLevelToGo 'NextPlayLevelToGo��֮ǰ�����ú���
         
NextPlayLevelToGo = 0

���³�ʼ������

GE.FadeIn 500

       If NextPlayLevelToGo = 1 Then '����Ϸ�������˵�����
              For i = 1 To 5
              GameBGM(i).Stop_
              Next i
              MenuBGM.Play
       End If

End If












'////////////////////////////////////����////////////////////////////////////
'////////////////////////////////////����////////////////////////////////////
'////////////////////////////////////����////////////////////////////////////
Case 5

TV.Clear

SCR.Draw_Texture GetTex("ShopBG"), 0, 0, FormWidth, FormHeight

SCRText.NormalFont_DrawText "��   ��", 500, 50, RGBA(1, 0.8, 0.4, 1), 2

If Button(12).MouseHasClick = True And GameSettings.MouseSensitivity > 0.5 Then '��������
GameSettings.MouseSensitivity = GameSettings.MouseSensitivity - 0.0005 * TV.TimeElapsed
End If
If Button(13).MouseHasClick = True And GameSettings.MouseSensitivity < 2 Then '��������
GameSettings.MouseSensitivity = GameSettings.MouseSensitivity + 0.0005 * TV.TimeElapsed
End If

'��Ч����
If Button(14).MouseHasClick = True Then
GameSettings.IsSoundOn = True '��Ч��
              If PlayLevelBeforeSetting = 6 Then GameBGM(GameBGMID).Play '����Ϸ�����ý���ľͲ���
End If

If Button(15).MouseHasClick = True Then
GameSettings.IsSoundOn = False '��Ч��
              If PlayLevelBeforeSetting = 6 Then GameBGM(GameBGMID).Pause
End If
       
If Button(16).MouseHasClick = True Then
       NextPlayLevelToGo = 1 '��������Ϊ�� Ȼ��������˹��ߵ�����
    ���ݴ浵 (DataType_SettingData)
    GE.FadeOut 500
End If


If NextPlayLevelToGo <> 0 And GE.IsFadeFinished = True Then
Playlevel = PlayLevelBeforeSetting '���ؽ���ĵط� ����Ϸ�����˵�
NextPlayLevelToGo = 0
GE.FadeIn 500
End If

       








'///////////////////////////////////////////��ͣ�˵�
Case 6
TV.Clear

'��ͣ�˵�
For i = 17 To 19
UI��ť�ж� (i)
Next i

If Button(17).MouseStatus = Button_IsClicked Then
Playlevel = 2
Picture1.Width = 17000
Picture1.Height = 10000
TV.ResizeDevice
Picture1.Width = Form1.Width
Picture1.Height = Form1.Height

End If


If Button(18).MouseStatus = Button_IsClicked Then
NextPlayLevelToGo = 5
PlayLevelBeforeSetting = 6 '˵���Ǵ�<����>����� '�����Ǵ���Ϸ�н������� Ҳ���������˵�����
GE.FadeOut 500
End If

If Button(19).MouseStatus = Button_IsClicked Then
NextPlayLevelToGo = 1 '�������˵�
GE.FadeOut 500
End If


If NextPlayLevelToGo <> 0 And GE.IsFadeFinished = True Then
              If NextPlayLevelToGo = 1 Then '����
                     For i = 1 To 3
                     GameBGM(i).Stop_
                     Next i
              MenuBGM.Play
              End If
Playlevel = NextPlayLevelToGo 'NextPlayLevelToGo��֮ǰ�����ú���
NextPlayLevelToGo = 0
GE.FadeIn 500
End If







'�˳�
Case 100
Form_Unload (0)




'����ͷ��������
Case 101
TV.Clear
StartAnimCountTime = StartAnimCountTime + TV.TimeElapsed
       Select Case StartAnimCountTime
       Case 0 To 7900
       SCR.Draw_Texture GetTex("MenuTitle"), FormCenterX - 200, FormCenterY - 300, FormCenterX + 200, FormCenterY - 50
       SCRText.NormalFont_DrawText "Made By X.X.O.X.X", FormCenterX - 150, FormCenterY, RGBA(1, 1, 1, 1), 1
       SCRText.NormalFont_DrawText "����΢��:@�����ʾ���ֲ����ٱ���-��ִ��", FormCenterX - 350, FormCenterY + 100, RGBA(1, 1, 1, 1), 1
       
       Case 7990 To 8000
       GE.FadeIn 1000
       Case 8000 To 10000
       SCRText.NormalFont_DrawText "��������:Visual Basic", FormCenterX - 150, FormCenterY - 50, RGBA(1, 1, 1, 1), 1
       SCRText.NormalFont_DrawText "3D����:TrueVision3D SDK 6.5", FormCenterX - 250, FormCenterY + 50, RGBA(1, 1, 1, 1), 1
       
       Case Is > 10000
       GE.FadeIn 1000
       Playlevel = 1
       End Select
       
End Select

















'�������ƶ�ϵͳ��ȷ����Ļ���� camlxҪ�ı� ����ʵ˳��Ӧ������ν��= =
SCR.Math_3DPointTo2D Vector(CamLX, CamLY, CamLZ), FormCenterX, FormCenterY, True

FormWidth = Int(FormCenterX) * 2

FormHeight = Int(FormCenterY) * 2


��ͼ2D


TV.RenderToScreen


'//////////////����
KeyCountTime.Key_PrintScreen = KeyCountTime.Key_PrintScreen + TV.TimeElapsed
If inputE.IsKeyPressed(TV_KEY_SYSRQ) = True And KeyCountTime.Key_PrintScreen > 1000 Then
GE.Flash 1, 1, 1, 500
KeyCountTime.Key_PrintScreen = 0
SetTextAlpha text_�ѽ���, 1

TV.Screenshot App.Path & "\��Ϸ��ͼ\SpaceRun" & Replace(CStr(Date), "/", " ") _
& Replace(CStr(Time), ":", " ") & ".jpg", TV_IMAGE_JPG
End If




Loop



TV.ReleaseAll


End


End Sub




































Sub f��Ⱦ(PL As Integer)
Select Case PL

Case 1

TV.Clear


'DeepRS.StartRender
atmo.Atmosphere_Render

StartTunnel.Render


For r = 1 To 15
NRWay(r).Render
Next


For a = 1 To 30
Asteroid(a).Render
Next


'��Ǯ�ܵ�
MoneySaveRunway.Render

'���� ����
GameTools.Magnet_Mesh.Render
GameTools.TimeSlow_Mesh.Render
GameTools.RecoverHP_Mesh.Render


If SE.EventActivated = True Then


    For a = 1 To 30
    
    
    FR(a).Mesh.Render
    
    
    ExplosionParticle(a).Render '��ʯ
    
    
    Next
    
    
SpeedUpTunnel.Render '�Ӽ���


SpeedDownTunnel.Render


SpeedTunnelRing(1).Render


SpeedTunnelRing(2).Render


SpeedUpParticle.Update
SpeedUpParticle.Render


SpeedDownParticle.Update
SpeedDownParticle.Render


NoGravityArea.Update '��������
NoGravityArea.Render



NGALaser.Render


End If

LittleRock.Render

For r = 1 To 70 '������money����ϵͳ  �������ϲ���Ⱦ
RMB(r).Render
PickMoneyParticle(r).Update
PickMoneyParticle(r).Render
Next



   



End Select

End Sub



Private Sub Form_Unload(Cancel As Integer)
TV.ReleaseAll
End
End Sub


