Attribute VB_Name = "�ƶ�ϵͳ"

Sub f�ƶ�ϵͳ()
10000        If TV.TimeElapsed > 50 Then GoTo ex: 'ͻȻһ�󿨾��뿪


10015        If Vcam < 25 Then Vcam = Vcam + 0.0001 * TV.TimeElapsed


10030        Scam = camX



10050        inputE.GetMouseState tmpmouseX, tmpmouseY


10065        RotateX = RotateX + tmpmouseX * TV.TimeElapsed / 10000 * GameSettings.MouseSensitivity * TimePassSpeed '����ƶ� ��ͷ��ת
             '������Ĭ��ֵΪ 1
10075        RotateY = RotateY - tmpmouseY * TV.TimeElapsed / 10000 * GameSettings.MouseSensitivity * TimePassSpeed

10085        Select Case RotateY

                    Case Is > 1

10105                      RotateY = 1

10115               Case Is < -1

10125                      RotateY = -1

10135        End Select


10150        Select Case RotateX

                    Case Is > 2.3

10170                      RotateX = 2.3

10180               Case Is < 0.8

10190                      RotateX = 0.8

10200        End Select


10215        DeltaVConst = (TV.TimeElapsed ^ 2) * 0.02 * F����

 
10230        If inputE.IsKeyPressed(TV_KEY_W) = True And HasJumped < 2 And CanPressW = True Then '����
10235               HasJumped = HasJumped + 1 '��������
10240               CanPressW = False
10245               If NoGravityActivated = False Then
10250                      VY = 0.4 * TV.TimeElapsed  '��������������
10255               Else
10260                      VY = (VY + TV.TimeElapsed ^ 2 / 1200)
10265               End If
10270        End If
 
 
 
10290        If inputE.IsKeyPressed(TV_KEY_A) = True Then ' And MoveToLaneActivated = False And HasPressA = False Then
10295               VR = VR - DeltaVConst / 2 ' DeltaVConst / 5�����������ٶ�Ҫ��
10300        End If


10315        If inputE.IsKeyPressed(TV_KEY_D) = True Then  ' And MoveToLaneActivated = False And HasPressD = False Then
10320               VR = VR + DeltaVConst / 2
10325        End If



10345        If CanPressW = False Then

10355               HasPressWTime = HasPressWTime + TV.TimeElapsed

10365               If HasPressWTime > 500 Then
    
10375                      CanPressW = True
    
10385                      HasPressWTime = 0
    
10395               End If
    
10405        End If

             'End If
             '///////////////////////////////////////////////////////



             ' If VR = 0 Then
             ' MoveToLaneActivated = False
             '     If inputE.IsKeyPressed(TV_KEY_A) = False Then HasPressA = False
             '     If inputE.IsKeyPressed(TV_KEY_D) = False Then HasPressD = False
             '  End If

             'Select Case VUp '�����ٶ� &���ٶ�
             'Case Is > TV.TimeElapsed * 1.5
             'VUp = TV.TimeElapsed * 1.5
             'Case Is < -TV.TimeElapsed * 1.5
             'VUp = -TV.TimeElapsed * 1.5
             'Case Is > 0
             'VUp = VUp - DeltaVConst
             '    If IsJumping = True Then VUp = VUp + DeltaVConst  '���мӵĲ�Ҫ��ô�డ
             'If VUp < 0 Then VUp = 0
             'Case Is < 0
             'VUp = VUp + DeltaVConst
             '    If IsJumping = True Then VUp = VUp - DeltaVConst
             'If VUp > 0 Then VUp = 0
             'End Select




10560        Select Case VR '�����ٶ� &���ٶ�

                    Case Is > TV.TimeElapsed * 3
10575                      VR = TV.TimeElapsed * 3


10590               Case Is < -TV.TimeElapsed * 3
10595                      VR = -TV.TimeElapsed * 3


10610               Case Is > 0 '���ҵ��ٶ�
10615                      VR = VR - DeltaVConst / 5
10620                      If VR < 0 Then VR = 0


10635               Case Is < 0
10640                      VR = VR + DeltaVConst / 5
                           ' If scene.Collision(Vector(camX, camY, camZ), Vector(camX, camY - 30, camZ)) = False Then VR = VR - DeltaVConst / 6
10650                      If VR > 0 Then VR = 0

10660        End Select


10675        If VY < -3 * TV.TimeElapsed Then VY = -3 * TV.TimeElapsed

10685        If VY > 3 * TV.TimeElapsed Then VY = 3 * TV.TimeElapsed
  
  
  
  
  
  
  
  
  
  
  
  
  
  

             '////////////////////////////////////////////////////////
  
             '//////////////////////��������/////////////////////////

             '��������������������������������������������������������������������������

             '��������������������������������������������������������������������������
10800        For i = 1 To 30

                    'ײ��С��ʯ�Ϳ�Ѫ
10815               If GetDistance(camX, camY, camZ, Asteroid(i).GetPosition.X, Asteroid(i).GetPosition.Y, Asteroid(i).GetPosition.Z) _
                       < 200 * Asteroid(i).GetScale.X Then

                           ' �����ƽ��������
10835                      HP = HP - Asteroid(i).GetScale.X ^ 2 * 100

10845                      GE.Flash 1, 0, 0, 300

10855                      SetTextAlpha text_ײ����ʯ, 1
                           '��Զ��
10865                      Asteroid(i).MoveRelative 6000, 0, 0

10875               End If

10885        Next i









             '���п���ײ�Ķ����Ĳ���
10940        With scene

                    '�����ٶ� �������
10955               If NoGravityActivated = False Then VY = VY - TV.TimeElapsed ^ 2 * TimePassSpeed / 1800 '��Ϊ����
                    '���ٶ�Ҫ����timeElapsed��ƽ��
                    '�ü��ٶ� �ٶ� ������ȥ�Ƶ�
                    '1s���ߵ�Y����·��ҪΪ��ֵ ���ܹ���TimeElapsed
 
10980               If .Collision(Vector(camX, camY, camZ), Vector(camX, camY - 50, camZ)) = True Then '��½��

                           '////////////����ٶ� ��Ѫ
10995                      If VY < -TV.TimeElapsed Then
        
11005                             SetTextAlpha text_ˤ����, 1
        
11015                             GE.Flash 1, 0, 0, 300
        
11025                             HP = HP + VY '̫��ˤ��Ҫ��Ѫ
        
11035                      End If
        
                           '//////////////��½���ߵ�ʱ��СС��һ�� ���������� ��Ϊ�趨�����50��λ����½
                           '����ֻ������ײ
11055                      NGALaser.SetCollisionEnable False

11065                      VY = 0.05 * TV.TimeElapsed



11085                      If HasJumped > 0 And inputE.IsKeyPressed(TV_KEY_W) = False Then '���� ��½
    
11095                             VY = 0.5 / (TimePassSpeed ^ 2)
    
11105                             HasJumped = 0
    
11115                      End If
    
    
                           '/////////��û��������
11135                      If HasJumped < 2 And inputE.IsKeyPressed(TV_KEY_W) = True And CanPressW = True Then
    
11145                             VY = 0.4 * TV.TimeElapsed / (TimePassSpeed ^ 2)
    
11155                      End If
    
    
    

11180                      If .Collision(Vector(camX, camY, camZ), Vector(camX, camY - 59.5, camZ)) = True Then
    
11190                             camY = camY + 3
        
11200                             VY = VY + 0.5
    
11210                      End If
    
    
11225               Else 'û��½
                           'Key_S ׹��
11235                      If inputE.IsKeyPressed(TV_KEY_S) = True Then

11245                             If NoGravityActivated = False Then
    
11255                                    VY = VY - TV.TimeElapsed ^ 2 * (TimePassSpeed) / 1800
    
11265                             Else
    
11275                                    VY = VY - TV.TimeElapsed ^ 2 * (TimePassSpeed) / 1200
        
11285                             End If
    
11295                      End If

11305               End If

 
 
11325               DeltaCamZ = VR / 5 '(Vcam * Cos(RotateX) - VR * Sin(RotateX)) / 5


11340               NGALaser.SetCollisionEnable True
                    '�ٶȴ���
11350               If .Collision(Vector(camX, camY, camZ), Vector(camX + Vcam * TV.TimeElapsed / 10, camY, camZ)) = False Then

11360                      camX = camX + Vcam * TimePassSpeed * TV.TimeElapsed / 20                       'sgn()������1������0  vcam * TV.TimeElapsed / 10����˵����X��������ӣ��ж���һ���ĺ�����

11370               Else

11380                      IsDead = True

11390               End If



                    'Z����
11415               If .Collision(Vector(camX, camY, camZ), Vector(camX, camY, camZ + (Sgn(DeltaCamZ) - 0.5) * 5)) = False Then
                           '��һ֡Z
11425                      camZ = camZ - DeltaCamZ * TimePassSpeed

11435                      Else: IsDead = True

11445               End If



                    'ͷ��ײ��
11470               If .Collision(Vector(camX, camY, camZ), Vector(camX, camY + 2, camZ)) = True Then

11480                      IsDead = True

11490               End If


11505        End With



             '��һ��ʼ�������
11530        If StartTunnel.Collision(Vector(camX, camY, camZ), Vector(camX, camY - 80, camZ), TV_TESTTYPE_DEFAULT) = True Then

11540               VY = 0

11550               HasJumped = 0

11560               CanPressW = True

11570        End If

             '��������������������������������������������������������������������������

             '��������������������������������������������������������������������������

             '��������������������������������������������������������������������������

             '��������������������������������������������������������������������������








11655        CamLX = camX + 200 * Sin(RotateX)
11660        CamLY = camY + 200 * Sin(RotateY)
11665        CamLZ = camZ + 200 * Cos(RotateX)

11675        camY = camY + VY * TimePassSpeed
11680        CamLY = CamLY + VY * TimePassSpeed

             'WriteLog ("vy:" & CStr(VY) & "   " & CStr(TV.GetFPS))



             '///////////////���������ٽ�߶�
11715        If camY < -1000 Then
11720               TimePassSpeed = 0.1
11725               If GameSettings.IsSoundOn = True Then
11730                      GameSound.HeartBeat.Play
11735               End If
11740               GameBGM(GameBGMID).Volume = -2000
11745        End If


             '/////////////�����ٽ�߶�
11765        If camY < -2000 Or HP <= 0 Then
11770               IsDead = True
11775        End If



11795        If IsDead = True Then
11800               cam.SetViewFrustum 60, 7000
11805               HP = 0
11810               GameBGM(GameBGMID).Volume = -800
11815               If GameSettings.IsSoundOn = True Then GameSound.Scream.Play
11820               If GameSettings.IsSoundOn = True Then GameSound.HeartBeat.Stop_
                    'Ϊ��֮��İ�ť��׼ȷ�ж�
11830               TV.ResizeDevice

11840        End If



11860        cam.SetCamera camX, camY, camZ, CamLX, CamLY, CamLZ

11870 ex:
End Sub















