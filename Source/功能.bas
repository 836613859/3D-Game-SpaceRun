Attribute VB_Name = "����"

Public Function GetDistance(x1 As Single, y1 As Single, z1 As Single, x2 As Single, y2 As Single, z2 As Single)


XD = Abs(x1 - x2)


YD = Abs(y1 - y2)


ZD = Abs(z1 - z2)


Dˮƽ�� = Sqr(XD ^ 2 + ZD ^ 2)


GetDistance = Sqr(Dˮƽ�� ^ 2 + YD ^ 2)


End Function













'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////

Public Function MoveCam(DirectionX As Single, DirectionY As Single, DirectionZ As Single, DLookatX As Single, DlookatY As Single, DlookatZ As Single, CamTime As Single, LookatTime As Single)


If TV.TimeElapsed / CamTime > 1 Then cantime = 1


 CamMoveX = (DirectionX - camX) * TV.TimeElapsed / CamTime
 
 
 CamMoveY = (DirectionY - camY) * TV.TimeElapsed / CamTime
 
 
 CamMoveZ = (DirectionZ - camZ) * TV.TimeElapsed / CamTime


 CamMoveLX = (DLookatX - CamLX) * TV.TimeElapsed / LookatTime
 
 
 CamMoveLY = (DlookatY - CamLY) * TV.TimeElapsed / LookatTime
 
 
 CamMoveLZ = (DlookatZ - CamLZ) * TV.TimeElapsed / LookatTime


If GetDistance(camX, camY, camZ, DirectionX, DirectionY, DirectionZ) < 5 Then


CamPosMoveFinish = True


camX = DirectionX


camY = DirectionY


camZ = DirectionZ


Else: CamPosMoveFinish = False


End If

If GetDistance(CamLX, CamLY, CamLZ, DLookatX, DlookatY, DlookatZ) < 5 Then


CamLookatMoveFinish = True


Else: CamLookatMoveFinish = False


End If


If CamPosMoveFinish = False Then


camX = camX + CamMoveX


camY = camY + CamMoveY


camZ = camZ + CamMoveZ


End If


If CamLookatMoveFinish = False Then


CamLX = CamLX + CamMoveLX


CamLY = CamLY + CamMoveLY


CamLZ = CamLZ + CamMoveLZ


End If


cam.SetCamera camX, camY, camZ, CamLX, CamLY, CamLZ


End Function






























'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Function WriteLog(WString As String)


Open "d:\TV3D.log" For Append As #1


Print #1, CStr(WString)


Close #1


End Function










'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'Public Sub RefreshExplosionAnim(RefreshTime As Single, ExpAnimId As Variant) '�ϵ���


'ExpAnimId = Val(ExpAnimId)


'If ExpAnim(ExpAnimId).Activated = True Then
'������Ļ���

'        ExpAnim(ExpAnimId).CountTime = ExpAnim(ExpAnimId).CountTime + TV.TimeElapsed
        '��ʱ����ʱ�ɣ�

'        If ExpAnim(ExpAnimId).CountTime > RefreshTime Then  '��ʱ������ ��Ҫ�����Ǳ������


'        ExpAnim(ExpAnimId).TextureID = ExpAnim(ExpAnimId).TextureID + 1


'        ExpAnim(ExpAnimId).CountTime = 0 '�����ļ�ʱ�� ����


'                If ExpAnim(ExpAnimId).TextureID = 8 Then '��8��ͼ /������
    
    
'                ExpAnim(ExpAnimId).TextureID = 0
    
    
'                ExpAnim(ExpAnimId).Activated = False
    
                
'                ExplosionAnimation(ExpAnimId).SetPosition 0, 0, 0 '��������߰�
    
'                End If
   '��ΪEXPL1 -8��˳�ż��ص�����IDҲ�������

'        End If
        
'End If
'ExplosionAnimation(ExpAnimId).SetTexture GetTex("expl1") + ExpAnim(ExpAnimId).TextureID
'End Sub












'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Function GetTextAlpha(ScrTextID As ScrTextName) As Single
GetTextAlpha = ScrTextAlpha(ScrTextID).Alpha
End Function

Public Sub SetTextAlpha(ScrTextID As ScrTextName, AlphaToSet As Single)
ScrTextAlpha(ScrTextID).Alpha = AlphaToSet
End Sub

Public Function GetTextSpeed(nScrTextID As ScrTextName) As Single
GetTextSpeed = ScrTextAlpha(nScrTextID).FadeOutSpeed
End Function
'If inputE.IsKeyPressed(TV_KEY_LEFTCONTROL) = True Then



















'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////

Public Sub f����(ShockUntil As Single, ShockRange As Single) ' ShockFrequency As Single) '����Ҫ���ʱ��
'�õ�ʱ��ǵü��� ������ʱ��������

Randomize


ShockTimeOnce = ShockTimeOnce + TV.TimeElapsed '��ʱ ���ε� ���Ӿ͹���


ShockTime = ShockTime + TV.TimeElapsed '��ʱ�伸ʱ ���Ӿ�����


If ShockActivated = True Then



        If ShockTimeOnce > 30 / TimePassSpeed Then
        

Form1.Picture1.Left = (-2 * ShockRange * Rnd(1) + ShockRange) * 15 '���غ�VB�����ת��


Form1.Picture1.Top = (-2 * ShockRange * Rnd(1) + ShockRange) * 15

        

        ShockTimeOnce = 0


        End If
        
        
End If




If ShockTime > ShockUntil Then


ShockActivated = False


ShockTime = 0


ShockTimeOnce = 0


Form1.Picture1.Left = 0


Form1.Picture1.Top = 0


End If


End Sub












'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////

Public Sub ���ý��(ResetMoneyMode As RMMode)

'money��һ�벻�þͲ������
'CoinSoundCountTime = CoinSoundCountTime + TV.TimeElapsed


If ResetMoneyMode = 0 Then '�����ɵ�����


    For r = 1 To 70
    
    
        If GetDistance(camX, camY, camZ, RmbPosX(r), RMB(r).GetPosition.Y, RmbPosZ(r)) < 30 Then '�õ����
        '////////��Ч

       If GameSettings.IsSoundOn = True Then GameSound.Coin(r).Play
              
        
        '///////ʧȥ����
            RmbIsMagnetic(r) = False
        
        '������������Ǯ
            UnSavedCashInGame = UnSavedCashInGame + 50 * MoneyMultiplier
            
        '/////////////�ӷ�
            GameScore = GameScore + 5 * TV.TimeElapsed * MoneyMultiplier
        
        
        '������������������������д����
            SetTextAlpha Text_�����50, 1
        
        
            PickMoneyParticle(r).ResetAll '��������������������Ǯ�����㶫��
            
            '����Ⱦ����update ��Ǯ�ĵط���Լ��camera��ǰ��
            PickMoneyParticle(r).SetGlobalPosition RmbPosX(r) + Vcam * 15, RMB(r).GetPosition.Y + 20, RmbPosZ(r) 'RmbPosX(r), RMB(r).GetPosition.Y, RmbPosZ(r)
        
        
       ' GE.Flash 0.6, 1, 0.6, 300
        
        
        
            RmbPosZ(r) = NRWay(r Mod 14 + 1).GetPosition.Z - 50 + 100 * Rnd(1) '
        
        
            RmbPosX(r) = NRWay(r Mod 14 + 1).GetPosition.X + (70 * (r Mod 5))
        
        
            RMB(r).SetPosition RmbPosX(r), NRWay((r Mod 14) + 1).GetPosition.Y + 20, RmbPosZ(r)
        
        
        End If


        If camX > RmbPosX(r) Then  'Խ��money��
        
        
            RmbIsMagnetic(r) = False
        
        
            RmbPosZ(r) = NRWay(r Mod 14 + 1).GetPosition.Z - 50 + 100 * Rnd(1) '
        
        
            RmbPosX(r) = NRWay(r Mod 14 + 1).GetPosition.X + (70 * (r Mod 5))
        
        
            RMB(r).SetPosition RmbPosX(r), NRWay((r Mod 14) + 1).GetPosition.Y + 70, RmbPosZ(r) '����moneyλ�� ��ÿ����ʯ�ܵ��� �����ȡZ ���30
        
        
        End If
    
    
    Next r
    
    
End If









If ResetMoneyMode = 1 Then


    For r = 1 To 70
        
        
            If GetDistance(camX, camY, camZ, RmbPosX(r), RMB(r).GetPosition.Y, RmbPosZ(r)) < 50 Then '�õ����
            

               If GameSettings.IsSoundOn = True Then GameSound.Coin(r).Play
            
            '���ܴ�������
                RmbIsMagnetic(r) = False
            
            
                PickMoneyParticle(r).ResetAll '��Ǯ�����㶫��
            
            '����Ⱦ����update
                PickMoneyParticle(r).SetGlobalPosition camX + Vcam * 15, RMB(r).GetPosition.Y + 20, RmbPosZ(r)
            
                '��������������������������Ǯ
                UnSavedCashInGame = UnSavedCashInGame + 50 * MoneyMultiplier '��Ǯ
            
                '//////////�ӷ�
                GameScore = GameScore + 5 * TV.TimeElapsed * MoneyMultiplier
            
            
                RmbPosZ(r) = 1000 + 50 * Rnd(1) '��һ���ռ䷶Χ��
            
            
                RmbPosX(r) = camX + 4000 + 2000 * Rnd(1)
            
            
                RMB(r).SetPosition RmbPosX(r), 300 + 50 * Rnd(1), RmbPosZ(r)
            
            
            End If
            
            
            If camX > RmbPosX(r) Then
            
                '���ܴ�������
                RmbIsMagnetic(r) = False
            
            
                RmbPosZ(r) = 1000 + 50 * Rnd(1) '��һ���ռ䷶Χ��
            
            
                RmbPosX(r) = camX + 4000 + 2000 * Rnd(1)
            
            
                RMB(r).SetPosition RmbPosX(r), 300 + 50 * Rnd(1), RmbPosZ(r)
            
            
            End If
            
            
    Next r
        
        
End If




'�ù�һǧ��
If UnSavedCashInGame Mod 1000 < 30 And UnSavedCashInGame <> 0 Then
    
    UnSavedCashInGame = UnSavedCashInGame + 50
    
    '������
    GE.Flash 0.6, 1, 0.6, 200
    
    SetTextAlpha Text_�����1000, 1
    
End If


End Sub









'////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
'////////////////////////////////////////////////////////////

Public Sub MoveRMB(RmbID As Long, DestinationX As Single, DestinationY As Single, DestinationZ As Single)


DeltaRmbMoveX = (DestinationX - RmbPosX(RmbID)) * TV.TimeElapsed / 100

DeltaRmbMoveY = (DestinationY - RMB(RmbID).GetPosition.Y) * TV.TimeElapsed / 100

DeltaRmbMoveZ = (DestinationZ - RmbPosZ(RmbID)) * TV.TimeElapsed / 100



RmbPosX(RmbID) = RmbPosX(RmbID) + DeltaRmbMoveX

RmbPosZ(RmbID) = RmbPosZ(RmbID) + DeltaRmbMoveZ


RMB(RmbID).SetPosition RmbPosX(RmbID), RMB(RmbID).GetPosition.Y + DeltaRmbMoveY, RmbPosZ(RmbID)

End Sub









'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Sub f�����ܵ�()


Randomize


For i = 1 To 15


         If camX - 1000 > NRWay(i).GetPosition.X Then '�Ѿ�Խ��ģ����
         
         
         NRWPosZ(i) = 300 * Int(5 * Rnd(1) + 1)
         
         
         NRWPosY(i) = -300 * Rnd(1) + 300
         
         
         NRWay(i).SetPosition camX + 6000, NRWPosY(i), NRWPosZ(i)
         
         
         End If
         
         
Next i


For a = 1 To 30


If Asteroid(a).GetPosition.Z < -200 Or Asteroid(a).GetPosition.Z > 2000 Or _
Asteroid(a).GetPosition.Y < -500 Or Asteroid(a).GetPosition.Y > 1500 Then '��������Ļ��͸�λ


Asteroid(a).SetPosition Asteroid(a).GetPosition.X, 700, 700 + 300 * Rnd(1)


End If
'AbsoluteRotateX
AstMP(a).AbsRX = AstMP(a).AbsRX + AstMP(a).RX * TimePassSpeed


AstMP(a).AbsRY = AstMP(a).AbsRY + AstMP(a).RY * TimePassSpeed


AstMP(a).AbsRZ = AstMP(a).AbsRZ + AstMP(a).RZ * TimePassSpeed


Asteroid(a).SetRotation AstMP(a).AbsRX, AstMP(a).AbsRY, AstMP(a).AbsRZ '���Ե���ת�Ƕ�

'��ʯ�ƶ�
Asteroid(a).MoveRelative _
AstMP(a).MX * TV.TimeElapsed * TimePassSpeed, _
AstMP(a).MY * TV.TimeElapsed * TimePassSpeed, _
AstMP(a).MZ * TV.TimeElapsed * TimePassSpeed


If camX - 500 > Asteroid(a).GetPosition.X Then '�Ѿ�Խ��ģ����


       Asteroid(a).SetPosition camX + 4500, Asteroid(a).GetPosition.Y, Asteroid(a).GetPosition.Z


End If


Next a

'����money///////////////////////////////////////
If SE.EventActivated = True And SE.EventID = SpecialEvent_NoGravityArea Then
���ý�� (ResetMode_Random)
Else
���ý�� (ResetMode_Normal)
End If
End Sub











'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
'//////////////////////////////////////////////////////////////////////////////////////////////////////////////
Public Function �����Ƽ���(InputValue As Double) As Double
'��ÿ8���������У���N���ͳ�N
EnCryptionFlag = EnCryptionFlag + 1

If EnCryptionFlag > 8 Then EnCryptionFlag = 1

�����Ƽ��� = InputValue * EnCryptionFlag

End Function


Public Function �����ƽ���(InputValue As Double) As Double
'��ÿ8���������У���N���ͳ�N
DeCryptionFlag = DeCryptionFlag + 1

If DeCryptionFlag > 8 Then EnCryptionFlag = 1

�����ƽ��� = InputValue / DeCryptionFlag

End Function



Public Sub ���ݴ浵(DataSaveMode As DataInputSaveMode)

EnCryptionFlag = 0 '����
DeCryptionFlag = 0 '����


'////////////////////////////////////////////////////
If DataSaveMode = DataType_SettingData Then   '����������

Open App.Path & "\Save\Settings.sav" For Binary As #1
Put #1, 1, �����Ƽ���(Val(GameSettings.MouseSensitivity))

If GameSettings.IsSoundOn = True Then
Put #1, 9, 1
Else
Put #1, 9, 0
End If

Close #1

End If
'//////////////////////////////////////////////////////
If DataSaveMode = DataType_PlayerData Then '���������

Open App.Path & "\Save\Player.sav" For Binary As #2
Put #2, 1, �����Ƽ���(Val(TotalCash))
Put #2, 9, �����Ƽ���(Val(GameTools.Eject_TheNumberPlayerHas))
Put #2, 17, �����Ƽ���(Val(GameTools.MoneySave_TheNumberPlayerHas))
Put #2, 25, �����Ƽ���(Val(GameTools.HP_InShop_TheNumberPlayerHas))
Put #2, 33, �����Ƽ���(Val(HighScore))
Close #2

End If

End Sub




Public Sub ���ݶ�ȡ() '(InputMode As DataInputSaveMode)
'If InputMode = DataType_SettingData Then '��������
Dim gd As Byte

       Open App.Path & "\Save\Settings.sav" For Binary As #3
       Dim GetDataSpace As Double  'Ҫ��double��
       Get #3, 1, GetDataSpace
       GameSettings.MouseSensitivity = Val(GetDataSpace)
       Get #3, 9, gd 'һ�ֽ�
       
       If gd = 1 Then '���� �ڴ����ʱ��true��1 false��0
       GameSettings.IsSoundOn = True
       Else
       GameSettings.IsSoundOn = False
       End If

       Close #3
'End If



'If InputMode = DataType_PlayerData Then '�����������
       Open App.Path & "\Save\Player.sav" For Binary As #4
       Dim GetDataSpace2 As Double  'Ҫ��double��
       'player�������4��double
       Get #4, 1, GetDataSpace2
       TotalCash = �����ƽ���(Val(GetDataSpace2))
       Get #4, 9, GetDataSpace2
       GameTools.Eject_TheNumberPlayerHas = �����ƽ���(Val(GetDataSpace2))
       Get #4, 17, GetDataSpace2
       GameTools.MoneySave_TheNumberPlayerHas = �����ƽ���(Val(GetDataSpace2))
       Get #4, 25, GetDataSpace2
       GameTools.HP_InShop_TheNumberPlayerHas = �����ƽ���(Val(GetDataSpace2))
       Get #4, 33, GetDataSpace2
       HighScore = �����ƽ���(Val(GetDataSpace2))
       Close #4
'End If

End Sub

