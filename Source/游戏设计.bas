Attribute VB_Name = "��Ϸ���"

Public Sub UI��ť�ж�(ButtonId As Integer)
With Button(ButtonId)

If MouseX > .LeftTop_X1 And MouseX < .LeftTop_X1 + .Width And _
MouseY > .LeftTop_Y1 And MouseY < .LeftTop_Y1 + .Height Then '�ڸ���������

.MouseIsOn = True

    '���������� ʱ�������������ť����¼���
        If inputE.IsMouseButtonPressed(0) = True Then
    
        .MouseHasClick = True
    
        Else
    
        .MouseHasClick = False
    
        End If

Else

.MouseIsOn = False

End If


'//////����ɵ��= =�Ƿ������� ��ʵ�����������IFֱ���޸İ�ť״̬
If .MouseIsOn = False Then .MouseStatus = Button_MouseNotOn

If .MouseIsOn = True Then .MouseStatus = Button_MouseOn

If .MouseIsOn = True And .MouseHasClick = True Then .MouseStatus = Button_IsClicked

'ѭ����û�� ���������next���Ǵ�����һ����ť

'��ťҪֱ����SCR�� ������
Select Case .MouseStatus
'���ûָ�� BUTTON1
Case Button_MouseNotOn

SCR.Draw_Texture GetTex("Button1"), .LeftTop_X1, .LeftTop_Y1, .LeftTop_X1 + .Width, .LeftTop_Y1 + .Height

'���ָ��
Case Button_MouseOn

SCR.Draw_Texture GetTex("Button2"), .LeftTop_X1, .LeftTop_Y1, .LeftTop_X1 + .Width, .LeftTop_Y1 + .Height

'������ȥ
Case Button_IsClicked
'ͼ������ BUTTON3���ⷢ���һ�� ΢���Ժ�λ
SCR.Draw_Texture GetTex("Button3"), .LeftTop_X1 - 10, .LeftTop_Y1 - 15, .LeftTop_X1 + .Width + 20, .LeftTop_Y1 + .Height + 20

End Select

End With

End Sub
















Public Sub ��ͼ2D()
'��ȡ������� PLAYLEVEL��������Ҫ��
inputE.GetAbsMouseState MouseX, MouseY

Select Case Playlevel

Case 1
'////////////����
SCR.Draw_Texture GetTex("MenuBG"), 0, 0, FormCenterX * 2, FormCenterY * 2

'////////////////SPACERUN��־
SCR.Settings_SetAlphaBlending True, TV_BLEND_ADD

SCR.Draw_Texture GetTex("MenuTitle"), 500, 20, 950, 250

SCR.Settings_SetAlphaBlending False, TV_BLEND_ALPHA




'///////////////��ť

'����Ϊaddģʽ
SCR.Settings_SetAlphaBlending True, TV_BLEND_ADD

For a = 1 To 4
'�˵��İ�ť
UI��ť�ж� (a)

Next a


'��ť����
SCRText.NormalFont_DrawText "��ʼ��Ϸ", Button(1).LeftTop_X1 + 20, Button(1).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "��    ��", Button(2).LeftTop_X1 + 25, Button(2).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "��    ��", Button(3).LeftTop_X1 + 25, Button(3).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "��    ��", Button(4).LeftTop_X1 + 25, Button(4).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
'���ALPHAģʽ
SCR.Settings_SetAlphaBlending False, TV_BLEND_ALPHA
'//////////////////΢��
SCRText.NormalFont_DrawText "����΢��:@�����ʾ���ֲ����ٱ���-��ִ��", 20, 20, RGBA(1, 1, 1, 1), 3

















Case 2
    '///////////////�����¼� GOLD BONUS��ʾ
    
    
For a = 1 To 20
'͸���ȴ���0 '���ﴦ����������
If ScrTextAlpha(a).Alpha > 0 Then

Select Case a

Case Text_С���
SCRText.NormalFont_DrawText "С��� +" & CStr(Gold_BonusCash), FormCenterX - 50, 50, RGBA(1, 1, 0.3, GetTextAlpha(Text_С���)), 1

Case Text_�����50 '50 X �ӱ�money
SCRText.NormalFont_DrawText "����� +" & CStr(50 * MoneyMultiplier), FormCenterX - 80, 50, RGBA(0.3, 1, 0.3, GetTextAlpha(Text_�����50)), 1

Case Text_�����1000
SCRText.NormalFont_DrawText "1000�� ��", FormCenterX - 80, 50, RGBA(0.6, 1, 0.6, GetTextAlpha(Text_�����1000)), 1

Case Text_������ģʽ
SCRText.NormalFont_DrawText "������ģʽ��С�ļ��⣡", FormCenterX - 400, FormCenterY - 40, RGBA(0.5, 0.5, 1, GetTextAlpha(Text_������ģʽ)), 2

Case Text_��齱��ģʽ
SCRText.NormalFont_DrawText "С��齱��ģʽ��", FormCenterX - 200, FormCenterY - 40, RGBA(1, 1, 0.3, GetTextAlpha(Text_��齱��ģʽ)), 2

Case text_ײ����ʯ
SCRText.NormalFont_DrawText "ײʯͷ���� HP-", FormCenterX - 80, 50, RGBA(1, 0.3, 0.3, GetTextAlpha(text_ײ����ʯ)), 1

Case text_ˤ����
SCRText.NormalFont_DrawText "ˤ�ú��� HP-", FormCenterX - 80, 50, RGBA(1, 0.3, 0.3, GetTextAlpha(text_ˤ����)), 1

Case text_������
SCRText.NormalFont_DrawText "Ҫ������ HP-", FormCenterX - 80, 50, RGBA(1, 0.3, 0.3, GetTextAlpha(text_������)), 1

Case text_С����ʯ
SCRText.NormalFont_DrawText "С����ʯ��", FormCenterX - 160, FormCenterY - 60, RGBA(1, 0.3, 0.3, GetTextAlpha(text_С����ʯ)), 2

Case text_�����������
SCRText.NormalFont_DrawText "����ͨ�����֣�", FormCenterX - 200, FormCenterY - 60, RGBA(1, 0.3, 0.3, GetTextAlpha(text_�����������)), 2

Case text_ʯ��ᶯ
SCRText.NormalFont_DrawText "ʯ�ܵ���Ъ���ƶ�....", FormCenterX - 250, FormCenterY - 60, RGBA(1, 0.3, 0.3, GetTextAlpha(text_ʯ��ᶯ)), 2

Case text_�õ�����
SCRText.NormalFont_DrawText "���ߴ���", FormCenterX - 160, FormCenterY - 60, RGBA(0.3, 0.5, 0.1, GetTextAlpha(text_�õ�����)), 2

Case text_��Ǯ
SCRText.NormalFont_DrawText "RMB�����˻� +" & UnSavedCashInGame, FormCenterX - 250, FormCenterY - 60, RGBA(0.6, 1, 0.6, GetTextAlpha(text_��Ǯ)), 2

Case text_��Ѫ
SCRText.NormalFont_DrawText "����Ѫ��", FormCenterX - 100, FormCenterY - 60, RGBA(1, 0.5, 0.3, GetTextAlpha(text_��Ѫ)), 2

Case text_����δ��ȴ
SCRText.NormalFont_DrawText "����δ��ȴ", FormCenterX - 80, 80, RGBA(0.3, 0.5, 1, GetTextAlpha(text_����δ��ȴ)), 1

Case text_�����Զ���Ǯϵͳ
SCRText.NormalFont_DrawText "�����Զ���Ǯϵͳ", FormCenterX - 120, 80, RGBA(1, 1, 1, GetTextAlpha(text_�����Զ���Ǯϵͳ)), 1

Case text_HP����
SCRText.NormalFont_DrawText "HP����", FormCenterX - 80, 80, RGBA(0.3, 0.5, 1, GetTextAlpha(text_HP����)), 1

Case text_�Ϳ�ʱ��ӳ�
SCRText.NormalFont_DrawText "�Ϳ�ʱ��ӳ� +" & StayInAirBonus, FormCenterX - 80, 80, RGBA(0.3, 0.5, 1, GetTextAlpha(text_�Ϳ�ʱ��ӳ�)), 1

Case text_ʱ�������ٶ�
SCRText.NormalFont_DrawText "ʱ�������ٶ� X" & TimePassSpeed, FormCenterX - 200, FormCenterY - 30, RGBA(0.3, 0.5, 1, GetTextAlpha(text_ʱ�������ٶ�)), 2

End Select

End If 'IF ALPHA>0
'ÿ�����ֵ�͸���Ȱ���Ԥ����ٶȵݼ�
ScrTextAlpha(a).Alpha = ScrTextAlpha(a).Alpha - ScrTextAlpha(a).FadeOutSpeed * TV.TimeElapsed
Next a


'/////////////·�̱���
SCR.Settings_SetAlphaBlending True, TV_BLEND_ADD

SCR.Draw_Texture GetTex("SpeedDial"), 0, 150, 200, 300, RGBA(1, 1, 1, 0.5)

SCRText.NormalFont_DrawText CStr(Int(Scam / 10)) & " KM", 20, 250, RGBA(1, 1, 1, 1), 3

SCR.Settings_SetAlphaBlending False, TV_BLEND_ALPHA


    '///////////////////////////////HP
'��������
'Ѫ��Խ�� ����ԽС
SCR.Draw_Texture GetTex("heart"), 0, FormHeight - Int(HP) * 2, Int(HP) * 2, FormHeight, RGBA(1, 1, 1, 1)

'HP Ѫ��
SCRText.NormalFont_DrawText CStr(Int(HP)), 10, FormHeight - 90, RGBA(0.3, 0.5, 1, 1), 2


'/////////////////////Money
SCR.Draw_Texture GetTex("RMB50"), 10, 10, 100, 60

SCRText.NormalFont_DrawText "�������Ǯ�� " & CStr(UnSavedCashInGame), 20, 40, RGBA(0, 0.5, 0.5, 1), 3

SCRText.NormalFont_DrawText "���˻���Ǯ�� " & CStr(TotalCash), 20, 80, RGBA(0, 0.5, 0.5, 1), 3

SCRText.NormalFont_DrawText "���� X", 20, 120, RGBA(1, 1, 1, 0.7), 3

SCRText.NormalFont_DrawText CStr(MoneyMultiplier), 150, 100, RGBA(1, 1, 1, 0.7), 2 '�����

'ADDģʽ��Ӱ�쵭�뵭��

'///////////////////////��Щģ�͵�2D����
'�������1000
If GetDistance(camX, camY, camZ, MoneySaveRunway.GetPosition.X, MoneySaveRunway.GetPosition.Y, MoneySaveRunway.GetPosition.Z) > 3000 Then
SCR.Math_3DPointTo2D MoneySaveRunway.GetPosition, MoneySave2DPointX, MoneySave2DPointY, True
SCRText.NormalFont_DrawText "��Ǯ�ܵ�", MoneySave2DPointX, MoneySave2DPointY, RGBA(1, 1, 1, 0.5), 4
End If


If SE.EventActivated = True Then
    '�Ӽ������
    If SE.EventID = SpecialEvent_SpeedTunnel Then
    SCR.Math_3DPointTo2D SpeedUpTunnel.GetPosition, SpeedUpDPointX, SpeedUp2DPointY, False
    SCRText.NormalFont_DrawText "�����ܵ�", SpeedUpDPointX, SpeedUp2DPointY, RGBA(1, 1, 1, 0.5), 4

    SCR.Math_3DPointTo2D SpeedUpTunnel.GetPosition, SpeedDownDPointX, SpeedDown2DPointY, False
    SCRText.NormalFont_DrawText "�������ܵ�", SpeedDownDPointX, SpeedDown2DPointY, RGBA(1, 1, 1, 0.5), 4
    End If
    

    '��ʾ��ʯ�����
    If SE.EventID = SpecialEvent_RockFall Then
    For i = 1 To 30
        '��һ���߶��ٻ���
        If FR(i).Mesh.GetPosition.Y > 150 Then
        SCR.Math_3DPointTo2D FR(i).Mesh.GetPosition, Fr2DX(i), Fr2DY(i), True
        SCR.Draw_FilledCircle Fr2DX(i), Fr2DY(i), 3, 18, RGBA(1, 0, 0, 1)
        End If
    Next i
    End If

End If

'///////��Ϸ���� ��������Ǯ �õ���֮���Ҳ�ӷ�
GameScore = GameScore + Int(Vcam * TV.TimeElapsed / 25)

SCRText.NormalFont_DrawText "����", FormWidth - 50, 70, RGBA(1, 1, 1, 1), 3

SCRText.NormalFont_DrawText Int(CStr(GameScore)), FormWidth - 200, 20, RGBA(1, 1, 1, 0.8), 1

'///////////////////////////����ӵ����
SCR.Settings_SetAlphaBlending True, TV_BLEND_ADDALPHA
'����
SCR.Draw_Texture GetTex("heart"), 250, FormHeight - 70, 300, FormHeight - 20
SCRText.NormalFont_DrawText CStr(GameTools.HP_InShop_TheNumberPlayerHas), 310, FormHeight - 70, RGBA(1, 1, 1, 1), 1
'���ϵļ�ͷ
SCR.Draw_Texture GetTex("EjectionArrow"), 350, FormHeight - 70, 400, FormHeight - 20
SCRText.NormalFont_DrawText CStr(GameTools.Eject_TheNumberPlayerHas), 410, FormHeight - 70, RGBA(1, 1, 1, 1), 1
'�Զ���Ǯ
SCR.Settings_SetAlphaBlending True, TV_BLEND_ALPHA
SCR.Draw_Texture GetTex("RMB50"), 450, FormHeight - 70, 500, FormHeight - 20
SCRText.NormalFont_DrawText CStr(GameTools.MoneySave_TheNumberPlayerHas), 510, FormHeight - 70, RGBA(1, 1, 1, 1), 1
'moneysave��״̬
If GameTools.MoneySave_IsUsing = True Then
SCRText.NormalFont_DrawText "�ѿ���", 550, FormHeight - 70, RGBA(0.3, 0.5, 1, 1), 3
Else
SCRText.NormalFont_DrawText "�ѹر�", 550, FormHeight - 70, RGBA(1, 0, 0, 1), 1
End If



'//////////////////////////�Ϳ�ʱ��ӳ�

If StayInAirTime > 3000 And SE.EventID <> SpecialEvent_NoGravityArea And GameTools.Eject_IsUsingSystem = False Then
'ʱ��Խ���ӳ�Խ��
StayInAirBonus = Int((StayInAirTime - 3000) * TimePassSpeed)

SetTextAlpha text_�Ϳ�ʱ��ӳ�, 1
'SCRText.NormalFont_DrawText "�Ϳ�ʱ��ӳ�+" & CStr(StayInAirBonus), FormCenterX - 120, 100, RGBA(0.3, 0.5, 1, 0.7), 1
End If


If scene.Collision(Vector(camX, camY, camZ), Vector(camX, camY - 100, camZ)) = True Then  '��½��
StayInAirTime = 0
       If StayInAirTime > 1500 Then
       UnSavedCashInGame = UnSavedCashInGame + (StayInAirTime - 1500)
       GameScore = GameScore + (StayInAirTime - 1500) * 5
       End If
Else
'�Ϳ�ʱ��+
StayInAirTime = StayInAirTime + TV.TimeElapsed
End If


'////////////////////////EjectionSystem
SCR.Settings_SetAlphaBlending True, TV_BLEND_MULTIPLY
If GameTools.Eject_HasStartTime > 500 And GameTools.Eject_HasStartTime < 5000 Then
SCR.Draw_FilledBox 0, 0, FormWidth, FormHeight, RGBA(1, 0, 0, 1)
End If
'If TimePassSpeed < 1 Then SCR.Draw_FilledBox 0, 0, FormWidth, FormHeight, RGBA(0, 1, 1, 1)
SCR.Settings_SetAlphaBlending True, TV_BLEND_ALPHA










'//////////////////////////////////
Case 3 '����


SCR.Settings_SetAlphaBlending True, TV_BLEND_ADD

'��������
SCR.Draw_Texture GetTex("MenuTitle"), FormCenterX - 200, 50, FormCenterX + 200, 250

'����������� ֻ��3����ť ������5��7
For a = 5 To 7

Button(a).LeftTop_X1 = Int(FormCenterX) - 1650 + a * 250 '��������

'�˵��İ�ť
UI��ť�ж� (a)

'��ť���� ��ť��addģʽ ��ҪӰ������
If a = 5 Then SCRText.NormalFont_DrawText "���¿�ʼ", Button(5).LeftTop_X1 + 25, Button(5).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
If a = 6 Then SCRText.NormalFont_DrawText "��    ��", Button(6).LeftTop_X1 + 25, Button(6).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
If a = 7 Then SCRText.NormalFont_DrawText "���ز˵�", Button(7).LeftTop_X1 + 25, Button(7).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1


'������
DieMenuCountTime = DieMenuCountTime + TV.TimeElapsed '��ʱ��


If DieMenuCountTime > 500 Then
        If DieMenuCountTime <= 600 Then GE.Flash 1, 1, 1, 300
SCRText.NormalFont_DrawText "��߷֣� " & Int(CStr(HighScore)), 400, 230, RGBA(1, 1, 1, 1), 1
SCRText.NormalFont_DrawText "�ܷ����� " & Int(CStr(GameScore)), 400, 280, RGBA(1, 1, 1, 1), 1
End If

If DieMenuCountTime > 1000 Then
        If DieMenuCountTime <= 1100 Then GE.Flash 1, 1, 1, 300
SCRText.NormalFont_DrawText "�߹���·�̣� " & Int(Scam / 10) + 20 & " KM", 400, 330, RGBA(1, 1, 1, 1), 1
End If

If DieMenuCountTime > 1500 Then
        If DieMenuCountTime <= 1600 Then GE.Flash 1, 1, 1, 300
SCRText.NormalFont_DrawText "�˻����� " & TotalCash, 400, 380, RGBA(1, 1, 1, 1), 1
End If

If DieMenuCountTime > 2000 Then
        If DieMenuCountTime <= 2100 Then GE.Flash 1, 1, 1, 300
SCRText.NormalFont_DrawText "���� ��" & UnSavedCashInGame & "���˷���", 400, 430, RGBA(1, 1, 1, 1), 1
End If

Next a


SCR.Settings_SetAlphaBlending True, TV_BLEND_ALPHA












'///////////////////////////////////////////
'//////////////////////////////////////////�̵�
Case 4
'RMB50
SCR.Draw_Texture GetTex("RMB50"), 150, 350, 230, 400
'��ģʽ
SCR.Settings_SetAlphaBlending True, TV_BLEND_ADD
'����
SCR.Draw_Texture GetTex("MenuTitle"), 20, 50, 350, 250
SCRText.NormalFont_DrawText "�� ��", 100, 250, RGBA(1, 0.8, 0.6, 1), 2
SCRText.NormalFont_DrawText "�˻��� ��" & TotalCash, 80, 450, RGBA(0.6, 1, 0.6, 1), 3


For a = 8 To 11
'�˵��İ�ť
UI��ť�ж� (a)
If a = 8 Then
SCRText.NormalFont_DrawText "�� �� ��", Button(a).LeftTop_X1 + 25, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "��3000", Button(a).LeftTop_X1 + 250, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "ӵ������" & GameTools.HP_InShop_TheNumberPlayerHas, Button(a).LeftTop_X1 - 150, Button(a).LeftTop_Y1 + 20, RGBA(0.6, 1, 0.6, 1), 3

End If

If a = 9 Then
SCRText.NormalFont_DrawText "����ϵͳ", Button(a).LeftTop_X1 + 25, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "��6000", Button(a).LeftTop_X1 + 250, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "ӵ������" & GameTools.Eject_TheNumberPlayerHas, Button(a).LeftTop_X1 - 150, Button(a).LeftTop_Y1 + 20, RGBA(0.6, 1, 0.6, 1), 3
End If

If a = 10 Then
SCRText.NormalFont_DrawText "�Զ���Ǯ", Button(a).LeftTop_X1 + 25, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "��4000", Button(a).LeftTop_X1 + 250, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
SCRText.NormalFont_DrawText "ӵ������" & GameTools.MoneySave_TheNumberPlayerHas, Button(a).LeftTop_X1 - 150, Button(a).LeftTop_Y1 + 20, RGBA(0.6, 1, 0.6, 1), 3
End If

If a = 11 Then
SCRText.NormalFont_DrawText "���ز˵�", Button(a).LeftTop_X1 + 25, Button(a).LeftTop_Y1 + 20, RGBA(1, 0.3, 0.5, 1), 1
End If



'��Ʒ����
If Button(a).MouseIsOn = True Then
    Select Case a
    Case 8
    SCRText.NormalFont_DrawText "ʹ��һ���Ϳ��Բ���Ѫ������Ѫ֮������á�", 500, 500, RGBA(1, 1, 1, 1), 3
    Case 9
    SCRText.NormalFont_DrawText "����ϵͳ������ʱ������������緢�����ϼ��٣�", 500, 500, RGBA(1, 1, 1, 1), 3
    SCRText.NormalFont_DrawText "׹������֮ǰ����������������", 500, 530, RGBA(1, 1, 1, 1), 3
    Case 10
    SCRText.NormalFont_DrawText "�ڱ���ÿ��7��ֱ�Ӱ����Ǯ�����˻�������Ȼ��Ҫ�ڴ�Ǯ�ܵ��ϴ棩", 500, 500, RGBA(1, 1, 1, 1), 3
    Case 11
    SCRText.NormalFont_DrawText "�������˵���", 500, 500, RGBA(1, 1, 1, 1), 3
    End Select
End If



Next a









'///////////////////////////////����
'///////////////////////////////����
'///////////////////////////////����
Case 5

SCR.Settings_SetAlphaBlending True, TV_BLEND_ADD
For a = 12 To 16
UI��ť�ж� (a)
Next a

'���������
SCRText.NormalFont_DrawText "-", Button(12).LeftTop_X1 + 10, Button(12).LeftTop_Y1, RGBA(0, 0, 0, 1), 2
SCRText.NormalFont_DrawText "+", Button(13).LeftTop_X1 + 10, Button(13).LeftTop_Y1, RGBA(0, 0, 0, 1), 2
SCRText.NormalFont_DrawText CStr(Round(GameSettings.MouseSensitivity, 1)), 500, 200, RGBA(1, 1, 1, 1), 2
SCRText.NormalFont_DrawText "���������", 470, 320, RGBA(1, 1, 1, 1), 1

'��Ч״̬
SCRText.NormalFont_DrawText "��", Button(14).LeftTop_X1 + 10, Button(14).LeftTop_Y1 + 20, RGBA(1, 1, 1, 1), 1
SCRText.NormalFont_DrawText "��", Button(15).LeftTop_X1 + 10, Button(15).LeftTop_Y1 + 20, RGBA(1, 1, 1, 1), 1

If GameSettings.IsSoundOn = True Then
SCRText.NormalFont_DrawText "��Ч״̬ ��", 430, 500, RGBA(1, 0.6, 0.6, 1), 1
Else
SCRText.NormalFont_DrawText "��Ч״̬ ��", 430, 500, RGBA(1, 0.6, 0.6, 1), 1
End If

SCRText.NormalFont_DrawText "��           ��", Button(16).LeftTop_X1 + 50, Button(16).LeftTop_Y1 + 40, RGBA(1, 0.3, 0.6, 1), 1




'///////////////////////////////////////////��ͣ�˵�
'///////////////////////////////////////////��ͣ�˵�
'///////////////////////////////////////////��ͣ�˵�
'///////////////////////////////////////////��ͣ�˵�
Case 6
SCRText.NormalFont_DrawText "��ͣ�˵�", 500, 50, RGBA(1, 0.5, 0.5, 1), 2

SCRText.NormalFont_DrawText _
"��       ��", _
Button(17).LeftTop_X1 + 10, _
Button(17).LeftTop_Y1 + 10, _
RGBA(1, 1, 0.5, 1), 1

SCRText.NormalFont_DrawText _
"��       ��", _
Button(18).LeftTop_X1 + 10, _
Button(18).LeftTop_Y1 + 10, _
RGBA(1, 1, 0.5, 1), 1


SCRText.NormalFont_DrawText _
"�������˵�", _
Button(19).LeftTop_X1 + 10, _
Button(19).LeftTop_Y1 + 10, _
RGBA(1, 1, 0.5, 1), 1



End Select





SCR.Settings_SetAlphaBlending False, TV_BLEND_ALPHA





'/////////������screentextalpha ����playlevel������
If ScrTextAlpha(20).Alpha > 0 Then
SCRText.NormalFont_DrawText "�ѽ���", FormCenterX - 50, FormCenterY - 20, RGBA(1, 1, 1, GetTextAlpha(text_�ѽ���)), 1
End If
ScrTextAlpha(20).Alpha = ScrTextAlpha(20).Alpha - ScrTextAlpha(20).FadeOutSpeed * TV.TimeElapsed





End Sub















'////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Sub �����¼�()


�����¼���ʼ��


If SE.EventActivated = True Then '�����¼�������


    Select Case SE.EventID
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    Case SpecialEvent_NoGravityArea  '1
    
    
    If camZ > 500 And camZ < 1500 And camY < 1000 And camY > -500 Then '�����뿪����
    
    '����������Ծ��������
    HasJumped = 0
    
    
    CanPressW = True
    
    
    NoGravityActivated = True
    
    
    Else
    
    
    NoGravityActivated = False
    
    
    End If
    
    
    
    
    
    '��ת
    
    '����RMB��һֱת���� ��ת�ı��� �ɴ�һ���ð� = =
    NGALaser.SetRotation RMBRotateY * 0.1, 0, 0
    
    
    
    
    If VY > 0 Then '��IF���е㰡 Y��ļ��ٶ�
    VY = VY - TV.TimeElapsed ^ 2 / 6400
        If VY < 0 Then VY = 0
    End If
    
    If VY < 0 Then
    VY = VY + TV.TimeElapsed ^ 2 / 6400
        If VY > 0 Then VY = 0
    End If
    
    
    
    
    
    If camX > NoGravityArea.GetGlobalPosition.X + 6000 Then  '���������������������������������������������¼�����
    
    NoGravityActivated = False
    
    SE.EventActivated = False
    
    SE.EventCountTime = 0
    
    SE.EventReBoostTime = 20000 + 10000 * Rnd(1)
    
    End If
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    
    Case SpecialEvent_RockFall '2
    
    
     ShockActivated = True
    
    
    f���� 5000, 8 '��֮ǰ�ȼ���
    
    
    For r = 1 To 30
    
    'ֱ��
    'FR(r).X = FR(r).X - TV.TimeElapsed    '��ͬ���ķ�����ٶȽ����� ����Ū��ͬ����
    
    
    FR(r).Y = FR(r).Y - 2 * TV.TimeElapsed
    
    
    FR(r).Mesh.SetPosition FR(r).X, FR(r).Y, FR(r).StartZ
    
    
    
            For i = 1 To 15
            
            '��ʯ��ը
            If NRWay(i).Collision(Vector(FR(r).X - 200, FR(r).Y - 200, FR(r).Z - 200), Vector(FR(r).X + 200, FR(r).Y + 200, FR(r).Z + 200), TV_TESTTYPE_ACCURATETESTING) = True Or FR(r).Y < -3000 Then
        '������һ���� �����Եظ�����ʯ�Ĵ�С ��¼����ײ������
            
            If GameSettings.IsSoundOn = True Then GameSound.Explode(r).Play
            
        
            ExplosionParticle(r).SetGlobalPosition FR(r).X, FR(r).Y - 200, FR(r).Z
            
            
            ExplosionParticle(r).Update
            
                '��ը��һ����Ѫ
                    If GetDistance(camX, camY, camZ, FR(r).X, FR(r).Y, FR(r).Z) < 50 Then
                
                '����˵�Ѫ��
                    HP = HP - GetDistance(camX, camY, camZ, FR(r).X, FR(r).Y, FR(r).Z) \ 3
                
                '���º�
                    GE.Flash 1, 0, 0, 200
                
                
                    End If
            
            '���Ա�ը��
            ExpAnim(r).Activated = True
            
        
            FRHasFallNumber = FRHasFallNumber + 1
        
            '��ը����ʯ�ӿ�
            FR(r).X = 0
            
            
            FR(r).Y = 0
            
            
            FR(r).Z = 0
        
        
            FR(r).Mesh.SetPosition 0, 0, 0


            End If
            
            Next i
    
            '������ը����Ҳ��Ѫ ��Ȼ��̫���� = = ����С��150�Ļ� ��Ĵ���̫����
            If GetDistance(camX, camY, camZ, ExplosionParticle(r).GetGlobalPosition.X, ExplosionParticle(r).GetGlobalPosition.Y, ExplosionParticle(r).GetGlobalPosition.Z) < 300 Then
                
                
            SetTextAlpha text_������, 1
                
                
            HP = HP - 0.03 * TV.TimeElapsed
                
                
            GE.Flash 1, 0, 0, 200
                
                
            End If
    Next r
    
    
    '����30����ʯ��
    If FRHasFallNumber >= 30 Then '���������������������������������������������¼�����
    
    SE.EventActivated = False
    
    SE.EventCountTime = 0
    
    SE.EventReBoostTime = 20000 + 10000 * Rnd(1)
    
    FRHasFallNumber = 0
    
    ShockActivated = False '����
    
    End If
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
    
    
    Case SpecialEvent_SpeedTunnel '3
    
    
    ShockActivated = True
    
    
    f���� 5000, 8 '��֮ǰ�ȼ���
    
    
    If CamViewDegree < 160 Then CamViewDegree = CamViewDegree + 0.003 * TV.TimeElapsed


    If CamViewDegree > 157 Then CamViewDegree = 160 '�������¼�3 ������� ���������ͷ�任


    cam.SetViewFrustum CamViewDegree, 7000
    
    
    
    If SpeedUpTunnel.Collision(Vector(camX, camY, camZ), Vector(camX, camY + 1, camZ), TV_TESTTYPE_BOUNDINGBOX) = True Then
    Vcam = Vcam + 0.00025 * TV.TimeElapsed '����
    
        If SpeedUpTunnel.Collision(Vector(camX, camY, camZ), Vector(camX, camY - 70, camZ), TV_TESTTYPE_ACCURATETESTING) = True Then
        VY = VY + 0.1 '��λ�ߵ�
        End If
        
    End If
        
        
    If SpeedDownTunnel.Collision(Vector(camX, camY, camZ), Vector(camX, camY + 1, camZ), TV_TESTTYPE_BOUNDINGBOX) = True Then
    
        If Vcam > 10 Then '�ٶȲ��ܼ�̫��
        Vcam = Vcam - 0.0005 * TV.TimeElapsed
        End If
    
        If SpeedDownTunnel.Collision(Vector(camX, camY, camZ), Vector(camX, camY - 70, camZ), TV_TESTTYPE_ACCURATETESTING) = True Then
        VY = VY + 0.1
        End If
        
    End If


    If camX > SpeedTunnelX + 5000 Then '���������������������������������������������¼�����
    
    SE.EventActivated = False
    
    SE.EventCountTime = 0
    
    SE.EventReBoostTime = 20000 + 10000 * Rnd(1)
    
    ShockActivated = False
    
    End If
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    Case SpecialEvent_Gold  '4


    For a = 1 To 30
    
    '�õ�С��ʯ
    If GetDistance(camX, camY, camZ, Asteroid(a).GetPosition.X, Asteroid(a).GetPosition.Y, Asteroid(a).GetPosition.Z) < 200 And _
    Asteroid(a).GetScale.X < 0.2 Then '��ΪSCALE��XYZ������һ�� ������һ���ж����Ŵ�С�͹���
    
    '��һ�»Ƶ�
    GE.Flash 1, 1, 0.3, 300
    
    
    Asteroid(a).MoveRelative -1000, 0, 0
    
    '����С���Ĵ�С ����BONUS��Ǯ�� ���50�ı�����
    Gold_BonusCash = Int(10000 * Asteroid(a).GetScale.X \ 50) * 50
    
    '��Ǯ
    UnSavedCashInGame = UnSavedCashInGame + Gold_BonusCash

    '/////////////�ӷ�
    GameScore = GameScore + 5000 * MoneyMultiplier


    SetTextAlpha Text_С���, 1
    
    
    End If
    Next
    
    
    SE_Gold_LastTime = SE_Gold_LastTime + TV.TimeElapsed
    
    
    
    
    
    If SE_Gold_LastTime > 15000 Then '�¼�����
    
    GE.Flash 1, 1, 0.3, 1000
    
    For i = 1 To 30
    
    Asteroid(i).SetTexture GetTex("rock")
    
    Asteroid(i).SetMaterial GetMat("asteroid")
    
    Asteroid(i).SetLightingMode TV_LIGHTING_NORMAL
    
    Next i
    
    SE_Gold_LastTime = 0
    
    SE.EventActivated = False
    
    SE.EventCountTime = 0
    
    SE.EventReBoostTime = 20000 + 10000 * Rnd(1)
    
    ShockActivated = False
     
    End If
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    '///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    Case 5
    
    RockHasMove_Time = RockHasMove_Time + TV.TimeElapsed

    For r = 1 To 15 'sin���ں���
    NRWay(r).SetPosition _
    NRWay(r).GetPosition.X, _
     NRWay(r).GetPosition.Y, _
    TmpNRWayPosZ(r) + 200 * (Sin(RockHasMove_Time * TimePassSpeed / MoveDifferenceConst(r)))
    Next r
    


    'If RockHasMove_Time > 9000 Then '1800����
    'RockHasMove_Rounds = RockHasMove_Rounds + 1 '��������һ
    'End If
    
    
    If RockHasMove_Time > 18000 Then    '�Ѿ����˼�������
    RockHasMove_Time = 0
    RockHasMove_Rounds = 0
    
    SE.EventActivated = False
    SE.EventCountTime = 0
    SE.EventReBoostTime = 20000 + 10000 * Rnd(1)
    End If
    
    
    
    End Select


End If


   ' WriteLog Time & Chr(13) & Chr(10) & "Activated" & SE.EventActivated
   ' WriteLog "Cam X:" & camX & " Y: " & camY
   ' WriteLog "Rock FR(1).X" & FR(1).X & " Z: " & FR(1).Z
   'WriteLog GetDistance(camX, camY, camZ, FR(1).X, FR(1).Y, FR(1).Z)

SE.EventCountTime = SE.EventCountTime + TV.TimeElapsed


End Sub










































'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Sub �����¼���ʼ��()

If SE.EventCountTime >= SE.EventReBoostTime And SE.EventActivated = False Then 'ʱ�䵽���¼����� �ȳ�ʼ��


Randomize


SE.EventReBoostTime = 20000 + 10000 * Rnd(1) '�ٳ�ʱ��Ϊ20 + (0~10)��


SE.EventCountTime = 0 '��һ���¼���ʱ�� ����


SE.EventActivated = True


SE.EventID = Int(5 * Rnd(1) + 1)



    Select Case SE.EventID '�¼����ݳ�ʼ�� ÿ��ִ��һ�ο�
    
    '///////////////////////////////////////1111111111111////////////////////////////////////////////////////////////////////////
    Case SpecialEvent_NoGravityArea  '1
    
    
    GE.Flash 0.5, 0.5, 1, 300
    
    
    SetTextAlpha Text_������ģʽ, 1
    
    
    NoGravityArea.SetGlobalPosition camX + 7000, 300, 1000


    NGALaser.SetPosition camX + 4000, 400, 1000
    
    

    '//////////////////////////////////////222222222222222222/////////////////////////////////////////////////////////////////////
    Case SpecialEvent_RockFall '2
    
    
    SetTextAlpha text_С����ʯ, 1
    
    
    For r = 1 To 30
    
    
    'FRExtraDistanceX(r) = 9000 * Rnd(1)
    
    '������cameraǰ��
    FR(r).StartX = camX + 280 * Vcam + r * 50
    
    
    FR(r).StartY = 6000 + r * 500 '
    
    
    FR(r).StartZ = 1000 * Rnd(1) + 400 '500 + 500 * Rnd(1)
    
    
    FR(r).X = FR(r).StartX
    
    
    FR(r).Y = FR(r).StartY
    
    
    FR(r).Z = FR(r).StartZ
    
    
    FR(r).Mesh.SetPosition FR(r).StartX, FR(r).StartY, FR(r).StartZ
    
    
    ExplosionParticle(r).ResetAll
    
    
    Next r
    
    '//////////////////////////////////////////3333333333333333//////////////////////////////////////////////////////////////////////////////
    Case SpecialEvent_SpeedTunnel '3
    
    SetTextAlpha text_�����������, 1
    
    
    '��λ�� ������� ����ת���Ļ�
    SpeedTunnelX = camX + 6000 '
    
    
    SpeedUpTunnel.SetPosition SpeedTunnelX, 350, 0
    
    '�ֱ������ ZΪ0 �� 2000
    SpeedDownTunnel.SetPosition SpeedTunnelX, 350, 2000
    
    
    SpeedTunnelRing(1).SetPosition SpeedTunnelX, 350, 0
    
    
    SpeedTunnelRing(2).SetPosition SpeedTunnelX, 350, 2000
    
    
    SpeedTunnelRing(1).PlayAnimation
    
    
    SpeedTunnelRing(2).PlayAnimation
    
    '����ϵͳ ��ͷ
    SpeedUpParticle.SetGlobalPosition SpeedTunnelRing(1).GetPosition.X, SpeedTunnelRing(1).GetPosition.Y, SpeedTunnelRing(1).GetPosition.Z
    
    
    SpeedDownParticle.SetGlobalPosition SpeedTunnelRing(2).GetPosition.X, SpeedTunnelRing(2).GetPosition.Y, SpeedTunnelRing(2).GetPosition.Z
    
    
    
    '///////////////////////////////////////////////444444444444444444//////////////////////////////////////////////////////////////////////////////////
    Case SpecialEvent_Gold '4


    GE.Flash 1, 1, 0.3
    
    
    SetTextAlpha Text_��齱��ģʽ, 1
    
    
    For i = 1 To 30
    
    Asteroid(i).SetLightingMode TV_LIGHTING_BUMPMAPPING_TANGENTSPACE
    
    Asteroid(i).SetTexture GetTex("Gold")
    
    Asteroid(i).SetMaterial GetMat("Solid")
    
    Next i
    
    
    
    '/////////////////////////////555555555556666666666666666666677777777777777777/////////////////////////////
    
    Case 5
    
    SetTextAlpha text_ʯ��ᶯ, 1
    
    RockHasMove_Time = 0 'ʯ�鿪ʼ���˶��
    
    RockHasMove_Rounds = 0 'ʯ�����˶��ٸ�����
    
    Randomize
    For a = 1 To 15
    TmpNRWayPosZ(a) = NRWay(a).GetPosition.Z
    MoveDifferenceConst(a) = 500 + 5000 * Rnd(1) 'sin(x / MoveDifference) ���������ٶ� ��������
    Next a

    End Select
    
    
End If

End Sub

















'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Sub �������Ǯ�ܵ�()

With GameTools



'/////////////////////////////////////////////////////����
'/////////////////////////////////////////////////////����
'/////////////////////////////////////////////////////����
'/////////////////////////////////////////////////////����
.Magnet_Mesh.SetRotation 0, RMBRotateY * 2, 0 '��������RMBһ����ת


'����õ�����
If .Magnet_IsPlayerHas = False And _
    GetDistance(camX, camY, camZ, .Magnet_Mesh.GetPosition.X, .Magnet_Mesh.GetPosition.Y, .Magnet_Mesh.GetPosition.Z) < 200 Then
       '������Ч
       If GameSettings.IsSoundOn = True Then GameSound.GetTools.Play

    SetTextAlpha text_�õ�����, 1

    GE.Flash 1, 1, 1, 300
    '���ӵ����
    .Magnet_IsPlayerHas = True

    '�ŵ�Զ��
    .Magnet_Mesh.SetPosition camX + Vcam * 2000, 300, 1000

End If

'/////Խ������Ҳ�ƶ�
If camX - (.Magnet_Mesh.GetPosition.X) > 300 Then .Magnet_Mesh.SetPosition camX + Vcam * 3000, 300, 500 + 1000 * Rnd(1)





'ӵ�д�����ʱ��
If .Magnet_IsPlayerHas = True Then

.Magnet_OnHandTime = .Magnet_OnHandTime + TV.TimeElapsed

For i = 1 To 70

    If GetDistance(camX, camY, camZ, RmbPosX(i), RMB(i).GetPosition.Y, RmbPosZ(i)) < 500 Then
    'MONEY���Ż�
    RmbIsMagnetic(i) = True

    End If

    
    If RmbIsMagnetic(i) = True Then
    
    '���ý�� Ǯ����Χ�ڻ��õ�Ǯ��
    MoveRMB Val(i), camX, camY, camZ
        
    End If

Next

End If





'��ʱ���û�˴���
If .Magnet_OnHandTime > 10000 Then
.Magnet_IsPlayerHas = False
.Magnet_OnHandTime = 0
    For i = 1 To 70
    RmbIsMagnetic(i) = False
    Next
End If












'/////////////////////////////////////////////////////////////����MONEY�ܵ�
'/////////////////////////////////////////////////////////////����MONEY�ܵ�
'/////////////////////////////////////////////////////////////����MONEY�ܵ�
'/////////////////////////////////////////////////////////////����MONEY�ܵ�
If MoneySaveRunway.Collision(Vector(camX, camY, camZ), Vector(camX, camY - 100, camZ), TV_TESTTYPE_BOUNDINGBOX) = True Then

        If HaveSavedMoney = False Then SetTextAlpha text_��Ǯ, 1

HaveSavedMoney = True

MoneyMultiplier = 1

End If




'���Դ�Ǯ���� �������Ѿ�д��
If HaveSavedMoney = True And GetTextAlpha(text_��Ǯ) <= 0 Then
TotalCash = TotalCash + UnSavedCashInGame
UnSavedCashInGame = 0
End If



If MoneySaveRunway.GetPosition.X + 3000 < camX Then
    
    'mul����5 ��Ȼ����μ����ܵ�����Ǯ�ͼ�multiplier
    If MoneyMultiplier < 5 And HaveSavedMoney = False Then
    MoneyMultiplier = MoneyMultiplier + 1
    End If

HaveSavedMoney = False

MoneySaveRunway.SetPosition camX + Vcam * 1500, 350, 500 + 1000 * Rnd(1)

End If












'///////////////////////////////////////��Ѫ����
'///////////////////////////////////////��Ѫ����
'///////////////////////////////////////��Ѫ����
'///////////////////////////////////////��Ѫ����
.RecoverHP_Mesh.SetRotation 0, RMBRotateY * 2, 0


With GameTools.RecoverHP_Mesh
'�õ�����
If GetDistance(camX, camY, camZ, .GetPosition.X, .GetPosition.Y, .GetPosition.Z) < 200 Then
'������Ч
If GameSettings.IsSoundOn = True Then GameSound.GetTools.Play

SetTextAlpha text_��Ѫ, 1

GE.Flash 1, 1, 1, 300

HP = 100

.SetPosition camX + Vcam * 3000, 300, 500 + 1000 * Rnd(1)

End If

End With 'Gametools.RecoverHP

End With 'Gametools






'////////////////////////////////////////�ı�����ʱ��
'////////////////////////////////////////�ı�����ʱ��
'////////////////////////////////////////�ı�����ʱ��
'////////////////////////////////////////�ı�����ʱ��
With GameTools.TimeSlow_Mesh
'������ת
.SetRotation 0, RMBRotateY * 2, 0
'�õ�����
If GetDistance(camX, camY, camZ, .GetPosition.X, .GetPosition.Y, .GetPosition.Z) < 200 Then
'������Ч
If GameSettings.IsSoundOn = True Then GameSound.GetTools.Play

SetTextAlpha text_ʱ�������ٶ�, 1
'����ʱ��
TimePassSpeed = 0.5
'��
GE.Flash 1, 1, 1, 300

GameTools.TimeSlow_IsPlayerHas = True
'��Զ��
.SetPosition camX + Vcam * 4000, 300, 500 + 1000 * Rnd(1)

End If

'����CLOCK û�õ�Ҳ����
If camX > .GetPosition.X + 500 Then .SetPosition camX + Vcam * 4000, 300, 500 + 1000 * Rnd(1)


'���ڷ�������ʱ��
If GameTools.TimeSlow_IsPlayerHas = True Then
'���õ��߼�ʱ��
GameTools.TimeSlow_OnHandTime = GameTools.TimeSlow_OnHandTime + TV.TimeElapsed
       If GameTools.TimeSlow_OnHandTime > 15000 Then
       GameTools.TimeSlow_OnHandTime = 0
       GameTools.TimeSlow_IsPlayerHas = False
       TimePassSpeed = 1
       End If
End If







'////////////////////////////////���ⰴ�������
'////////////////////////////////���ⰴ�������
'////////////////////////////////���ⰴ�������
'////////////////////////////////���ⰴ�������
KeyCountTime.Key_LeftCtrl_Time = KeyCountTime.Key_LeftCtrl_Time + TV.TimeElapsed 'LCTRL
KeyCountTime.Key_Space_Time = KeyCountTime.Key_Space_Time + TV.TimeElapsed '�ո�
KeyCountTime.Key_PrintScreen = KeyCountTime.Key_PrintScreen + TV.TimeElapsed '����

'////////////////////��Ѫ
If inputE.IsKeyPressed(TV_KEY_LEFTCONTROL) And _
GameTools.HP_InShop_TheNumberPlayerHas > 0 Then '����ctrl������Ѫ��ӵ����������
       If HP = 100 Then SetTextAlpha text_HP����, 1
       If HP < 100 Then
              If KeyCountTime.Key_LeftCtrl_Time > 5000 Then '���԰�CTRL
       
              GE.Flash 1, 1, 1, 300
              
              '������Ч
              If GameSettings.IsSoundOn = True Then GameSound.GetTools.Play
              
              
              SetTextAlpha text_��Ѫ, 1
       
              HP = 100
       
              GameTools.HP_InShop_TheNumberPlayerHas = GameTools.HP_InShop_TheNumberPlayerHas - 1
       
              '������ȴʱ��
              KeyCountTime.Key_LeftCtrl_Time = 0
       
              ���ݴ浵 (DataType_PlayerData)
       
              Else 'δ��ȴ
       
              SetTextAlpha text_����δ��ȴ, 1
       
              End If
              
       End If
       
End If








'///////////////////////////////////////////////////����ϵͳ
If inputE.IsKeyPressed(TV_KEY_SPACE) And GameTools.Eject_IsUsingSystem = False And _
GameTools.Eject_TheNumberPlayerHas > 0 Then '����space��û���ã�ӵ����������

              If KeyCountTime.Key_Space_Time > 10000 Then '���԰�CTRL
              
              StayInAirTime = 0
              
              GameTools.Eject_IsUsingSystem = True
              
              GameTools.Eject_TheNumberPlayerHas = GameTools.Eject_TheNumberPlayerHas - 1
              
             '������ȴʱ��
             KeyCountTime.Key_Space_Time = 0
             
              ���ݴ浵 (DataType_PlayerData)
              
             Else 'δ��ȴ
             
             SetTextAlpha text_����δ��ȴ, 1
             
             End If
             
End If

If GameTools.Eject_IsUsingSystem = True Then
GameTools.Eject_HasStartTime = GameTools.Eject_HasStartTime + TV.TimeElapsed
       Select Case GameTools.Eject_HasStartTime
       '����
       Case 0 To 200
       TimePassSpeed = 0.05
       GE.Flash 1, 1, 1, 500
       '����
       Case 300 To 3500
       '��BGM���� ǿ��������
       GameBGM(GameBGMID).Volume = -2000
       If GameSettings.IsSoundOn = True Then GameSound.HeartBeat.Play
       TimePassSpeed = 0.05
       
       Case 3500 To 5000
       GameSound.Eject_Charge.Play
       
       '�ָ�
       Case Is > 5000
       If GameSettings.IsSoundOn = True Then GameSound.HeartBeat.Stop_
       GameSound.Eject_Charge.Stop_
       GameBGM(GameBGMID).Volume = -800
       '�Ϳ�ʱ�����
       StayInAirTime = 0
       'ʱ�������ٶ�
       TimePassSpeed = 1
       '���ٶ����� 3*TV.TIMEELAPSED
       VY = 1.5 * TV.TimeElapsed
       If GameSettings.IsSoundOn = True Then GameSound.Eject_Boost.Play
              If camY < -1000 Then '�������-1000��λ��������
              VY = 2 * TV.TimeElapsed
              camY = -999
              End If
       GameTools.Eject_HasStartTime = 0
       GameTools.Eject_IsUsingSystem = False
       End Select
End If







'/////////////////////////////////////////////////////��ʱ��Ǯ
If inputE.IsKeyPressed(TV_KEY_RETURN) And GameTools.MoneySave_TheNumberPlayerHas > 0 And _
GameTools.MoneySave_IsUsing = False Then '����ctrl������Ѫ��ӵ����������

              '������Ч
              If GameSettings.IsSoundOn = True Then GameSound.GetTools.Play

              GameTools.MoneySave_IsUsing = True
              
              SetTextAlpha text_�����Զ���Ǯϵͳ, 1
              
              GameTools.MoneySave_TheNumberPlayerHas = GameTools.MoneySave_TheNumberPlayerHas - 1
              
              '������ȴʱ��
              ���ݴ浵 (DataType_PlayerData)
              
End If

'�������Զ���Ǯ
If GameTools.MoneySave_IsUsing = True Then

GameTools.MoneySave_HasSavedTime = GameTools.MoneySave_HasSavedTime + TV.TimeElapsed

       If GameTools.MoneySave_HasSavedTime > 10000 Then 'ÿ10���һ��Ǯ
       TotalCash = TotalCash + UnSavedCashInGame
       UnSavedCashInGame = 0
       GameTools.MoneySave_HasSavedTime = 0 '��ʱ������
       End If
       
End If

End With 'TimeSlowMesh
















End Sub





















