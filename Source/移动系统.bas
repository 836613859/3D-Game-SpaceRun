Attribute VB_Name = "���"
Sub f�ƶ�ϵͳ()

inputE.GetMouseState tmpmouseX, tmpmouseY
inputE.GetMousePosition mouseX, mouseY

RotateX = RotateX + tmpmouseX * TV.TimeElapsed / 1000  '����ƶ� ��ͷ��ת
RotateY = RotateY - tmpmouseY * TV.TimeElapsed / 1000

Select Case RotateY
Case Is > 2
RotateY = 2
Case Is < -2
RotateY = -2
End Select

'If IsJumping = False Then '�ڿ��в��������ɵ��ƶ��� ������
   If inputE.IsKeyPressed(TV_KEY_W) = True Then
   VF = VF + TV.TimeElapsed / 6 * F����
   End If

   If inputE.IsKeyPressed(TV_KEY_S) = True Then
   VF = VF - TV.TimeElapsed / 6 * F����
   End If

   If inputE.IsKeyPressed(TV_KEY_A) = True Then
   VR = VR - TV.TimeElapsed / 6 * F����
   End If

   If inputE.IsKeyPressed(TV_KEY_D) = True Then
   VR = VR + TV.TimeElapsed / 6 * F����
   End If
'End If
'///////////////////////////////////////////////////////

Select Case VF '�����ٶ� &���ٶ�
Case Is > TV.TimeElapsed * 1.5
VF = TV.TimeElapsed * 1.5
Case Is < -TV.TimeElapsed * 1.5
VF = -TV.TimeElapsed * 1.5
Case Is > 0
VF = VF - 0.2 * TV.TimeElapsed / 5 * F����
    If IsJumping = True Then VF = VF + 0.19 * TV.TimeElapsed / 5 * F���� '���мӵĲ�Ҫ��ô�డ
If VF < 0 Then VF = 0
Case Is < 0
VF = VF + 0.2 * TV.TimeElapsed / 5 * F����
    If IsJumping = True Then VF = VF - 0.19 * TV.TimeElapsed / 5 * F����
If VF > 0 Then VF = 0
End Select

Select Case VR '�����ٶ� &���ٶ�
Case Is > TV.TimeElapsed * 1.5
VR = TV.TimeElapsed * 1.5
Case Is < -TV.TimeElapsed * 1.5
VR = -TV.TimeElapsed * 1.5
Case Is > 0
VR = VR - 0.2 * TV.TimeElapsed / 5 * F����
    If IsJumping = True Then VR = VR + 0.19 * TV.TimeElapsed / 5 * F����
If VR < 0 Then VR = 0
Case Is < 0
VR = VR + 0.2 * TV.TimeElapsed / 5 * F����
     If IsJumping = True Then VR = VR - 0.19 * TV.TimeElapsed / 5 * F����
If VR > 0 Then VR = 0
End Select

If GravityV < -10 Then GravityV = -10
'////////////////////////////////////////////////////////
'//////////////////////��������/////////////////////////
f��ײ����

CamLX = camX + 1000 * Sin(RotateX)
CamLY = camY + 1000 * Sin(RotateY)
CamLZ = camZ + 1000 * Cos(RotateX)


'////////////////////////��Ծ���������ٶ�//////////////////////
If IsJumping = True Then GravityV = GravityV - TV.TimeElapsed / 400 '��Ϊ����
If IsJumping = False Then GravityV = 0

   If inputE.IsKeyPressed(TV_KEY_SPACE) = True And IsJumping = False Then
   IsJumping = True
   F���� = 0.1
   GravityV = 0.8
   tmpRotateX = RotateX
   tmpRotateY = RotateY
   End If
   
camY = camY + GravityV
cam.SetCamera camX, camY, camZ, CamLX, CamLY, CamLZ
Blood.SetGlobalPosition camX + 10, camY, camZ + 10
Blood.Update


HandX = camX
HandY = camY - 1
HandZ = camZ
hands.SetPosition HandX, HandY, HandZ
hands.LookAtPoint Vector(CamLX, CamLY, CamLZ), False

End Sub





Sub f��ײ����()

With scene

If IsJumping = False Then '������궯��Ҳ������ת��
tmpRotateX = RotateX
tmpRotateY = RotateY
End If


DeltaCamX = (VF * Sin(tmpRotateX) + VR * Cos(tmpRotateX)) * TV.TimeElapsed / 10   '��ǰ��������ɵľ�������ϵ��X����仯
DeltaCamZ = (VF * Cos(tmpRotateX) - VR * Sin(tmpRotateX)) * TV.TimeElapsed / 10   '��ǰ��������ɵľ�������ϵ��Z����仯

If .Collision(Vector(camX, camY, camZ), Vector(camX + (Sgn(DeltaCamX) - 0.5) * 15, camY, camZ)) = False And .Collision(Vector(camX + (Sgn(DeltaCamX) - 0.5) * 15, camY - 70, camZ), Vector(camX + (Sgn(DeltaCamX) - 0.5) * 15, camY - 70, camZ)) = False Then '��һ��X �������岻ײ
camX = camX + DeltaCamX 'sgn()������1������0 (Sgn(DeltaCamX) - 0.5) * 15����˵����X��������ӣ��ж���һ���ĺ�����
Else: camX = camX
End If

If .Collision(Vector(camX, camY, camZ), Vector(camX, camY, camZ + (Sgn(DeltaCamZ) - 0.5) * 15)) = False And .Collision(Vector(camX, camY, camZ + Sgn(DeltaCamZ) - 0.5 * 15), Vector(camX, camY - 70, camZ + (Sgn(DeltaCamZ) - 0.5) * 15)) = False Then '��һ��X �������岻ײ
camZ = camZ + DeltaCamZ
Else: camZ = camZ
End If



'////////////////////Y����Ĵ���/////////////////////////////
If .Collision(Vector(camX, camY, camZ), Vector3(camX, camY - 100, camZ)) = True Then
IsJumping = False
    If .Collision(Vector(camX, camY, camZ), Vector(camX, camY - 99.5, camZ)) = True Then camY = camY + 0.5
    
    If GravityV < -3 Then 'ˤ����
    HP = HP - Abs(GravityV) * 10
    GE.Flash 1, 0, 0, 1000
    End If
    
    
F���� = 0.5
Else
IsJumping = True
F���� = 0.1
End If


   If .Collision(Vector(camX, camY, camZ), Vector(camX + (Sgn(DeltaCamX) - 0.5) * 15, camY - 110, camX + (Sgn(DeltaCamZ) - 0.5) * 15)) = False Then
   F���� = 0.5
   End If


End With

End Sub



Sub f����ϵͳ()
If inputE.IsMouseButtonPressed(0) = True And HandIsPlaying = False Then
HandIsPlaying = True
hands.SetAnimationByName ("left")
hands.PlayAnimation 3
End If

If inputE.IsMouseButtonPressed(1) = True And HandIsPlaying = False Then
HandIsPlaying = True
hands.SetAnimationByName ("right")
hands.PlayAnimation 3
End If


If hands.IsAnimationFinished = True Then
hands.StopAnimation
HandIsPlaying = False
End If

End Sub








