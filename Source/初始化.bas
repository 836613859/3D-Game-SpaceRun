Attribute VB_Name = "��ʼ��"


Public Sub f��ʼ��()
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'\\\\\\\\\\\\\\����\\\\\\\\\\\\\\\\
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
Playlevel = 101
Vcam = 10 '�ٶ�
Scam = 0 '·��
camX = -400
camY = 550
camZ = 700
CamLX = 200
CamLY = 550
CamLZ = 700
HP = 100
VY = 0 '�����ٶ�
RotateX = 1.57 '�������� �ӵ�
RotateY = 0
SunSize = 2 '�Ǹ�����Ĵ�С
RMBRotateY = 0
MoneyMultiplier = 1
StayInAirTime = 0
'CoinSoundID = 1

TimePassSpeed = 1 'ʱ�������ٶ� ������������



GameTools.Magnet_IsPlayerHas = False
GameTools.Magnet_OnHandTime = 0
GameTools.Eject_IsUsingSystem = False
GameTools.Eject_Step = 1 '���䲽��
GameTools.Eject_HasStartTime = 0
GameTools.TimeSlow_IsPlayerHas = False
GameTools.TimeSlow_OnHandTime = 0


SE.EventReBoostTime = 20000 '����
SE.EventCountTime = 0
SE.EventActivated = False


NextPlayLevelToGo = 0 '�ڲ˵������õ� ��Ϊ��ͻ�PLAYLEVEL


ShockActivated = False
HasJumped = 0

CanPressW = True

VR = 0
F���� = 1 '���ϵ�1�����е�С��ģ�����


���ݶ�ȡ
'Ĭ��ֵ
If GameSettings.MouseSensitivity = 0 Then GameSettings.MouseSensitivity = 1
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
'\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

'/////////////////////set��������̳�ʼ��/////////////////////////

Set TV = New TVEngine
TV.Init3DWindowed Form1.Picture1.hwnd
TV.DisplayFPS True
TV.SetVSync True
TV.SetAngleSystem TV_ANGLE_DEGREE
'TV.SwitchFullscreen 1080, 720

'///////////////////////////��ͼ��////////////////////////

Set texF = New TVTextureFactory
    texF.LoadTexture App.Path & "\SkyBox\Up.jpg", "SkyTop"
    texF.LoadTexture App.Path & "\SkyBox\Down.jpg", "SkyBottom"
    texF.LoadTexture App.Path & "\SkyBox\Left.jpg", "SkyLeft"
    texF.LoadTexture App.Path & "\SkyBox\Right.jpg", "SkyRight"
    texF.LoadTexture App.Path & "\SkyBox\Front.jpg", "SkyFront"
    texF.LoadTexture App.Path & "\SkyBox\Back.jpg", "SkyBack"
    
    
    texF.LoadTexture App.Path & "\Mesh\Planet.dds", "sun"
    texF.LoadTexture App.Path & "\Mesh\RMB50.dds", "RMB50"
    texF.LoadTexture App.Path & "\Mesh\RMB100.dds", "RMB100"
    texF.LoadTexture App.Path & "\Mesh\����13.jpg", "Gold"
    texF.LoadTexture App.Path & "\Mesh\rock.jpg", "Rock"
    
    
    texF.LoadTexture App.Path & "\UI\Menu.jpg", "MenuBG"
    texF.LoadTexture App.Path & "\UI\Title.dds", "MenuTitle"
    texF.LoadTexture App.Path & "\UI\Button1.dds", "Button1"
    texF.LoadTexture App.Path & "\UI\Button2.dds", "Button2"
    texF.LoadTexture App.Path & "\UI\Button3.dds", "Button3"
    texF.LoadTexture App.Path & "\UI\heart.dds", "heart"
    texF.LoadTexture App.Path & "\UI\Speed.jpg", "SpeedDial"
    texF.LoadTexture App.Path & "\UI\Magnet.dds", "MagnetUI"
    texF.LoadTexture App.Path & "\UI\Shop.jpg", "ShopBG"
    texF.LoadTexture App.Path & "\UI\UpArrow.jpg", "EjectionArrow"
    
    For t = 1 To 8
    texF.LoadTexture App.Path & "\Mesh\Anim\Expl" & CStr(t) & ".jpg", "expl" & CStr(t), , , TV_COLORKEY_BLACK
    Next t


    
    
    
    For f = 1 To 4
    texF.LoadTexture App.Path & "\Mesh\flare" & CStr(f) & ".jpg", "Flare" & CStr(f)
    Next
    'atmo.LensFlare_Enable True
    'atmo.LensFlare_SetLensNumber 4
    'atmo.LensFlare_SetLensParams 1, GetTex("Flare1"), 2, 40, RGBA(1, 1, 1, 0.5), RGBA(1, 1, 1, 0.5)
    'atmo.LensFlare_SetLensParams 2, GetTex("Flare2"), 2, 18, RGBA(1, 1, 1, 0.5), RGBA(1, 1, 1, 0.5)
    'atmo.LensFlare_SetLensParams 3, GetTex("Flare3"), 2, 15, RGBA(1, 1, 1, 0.5), RGBA(0.7, 1, 1, 0.5)
    'atmo.LensFlare_SetLensParams 4, GetTex("Flare4"), 2, 6, RGBA(1, 0.1, 0, 0.5), RGBA(0.5, 1, 1, 0.5)
'//////////////////////////���ʿ�/////////////////////////////////////////
Set MatF = New TVMaterialFactory

MatF.CreateMaterial ("solid")
MatF.SetAmbient GetMat("solid"), 0.1, 0.1, 0.1, 0.5           '������
MatF.SetDiffuse GetMat("solid"), 1, 1, 1, 0.3 '��ɢ�⣬������Ĺ�����ɫ
'MatF.SetEmissive GetMat("solid"), 0, 0, 0.2, 0.2    '�Է���
MatF.SetOpacity GetMat("solid"), 1 '��͸����
MatF.SetSpecular GetMat("solid"), 1, 0.8, 0.8, 1   '�߹�ɫ
MatF.SetPower GetMat("solid"), 150  'ɢ��ǿ��


MatF.CreateMaterial "asteroid"
MatF.SetAmbient GetMat("Asteroid"), 0, 0, 0, 0.1           '������
MatF.SetDiffuse GetMat("Asteroid"), 1, 1, 1, 0.1 '��ɢ�⣬������Ĺ�����ɫ
MatF.SetEmissive GetMat("Asteroid"), 0.05, 0.15, 0.05, 0.25     '�Է���

 
 
 
 
 
'///////////////////////////�ƹ�����/////////////////////////////
Set LE = New TVLightEngine

LE.CreateDirectionalLight Vector(-1, -0.7, 0), 0.6, 1, 0.6, , 5
'LE.SetGlobalAmbient 0.2, 0.1, 0.1
LE.SetSpecularLighting True
LE.SetLightSpecularColor 0, 1, 1, 1
 
 
 
 
 
 
'////////////////////////������//////////////////////////////
Set atmo = New TVAtmosphere
atmo.SkyBox_SetColor 1, 1, 1, 1
 atmo.SkyBox_SetTexture GetTex("SkyFront"), GetTex("SkyBack"), GetTex("SkyLeft"), GetTex("SkyRight"), GetTex("SkyTop"), GetTex("SkyBottom")
 atmo.SkyBox_Enable True
 atmo.SkyBox_SetScale 1.28, 0.72, 1.28
 
 atmo.Fog_Enable True
 atmo.Fog_SetType TV_FOG_LINEAR, TV_FOGTYPE_PIXEL
 atmo.Fog_SetColor 0, 0.05, 0
 atmo.Fog_SetParameters 2000, 4000, 0.5
 
 atmo.Sun_Enable True
 atmo.Sun_SetBillboardSize SunSize
 atmo.Sun_SetBlendingMode TV_BLEND_ALPHA
 atmo.Sun_SetPosition 3000, 500, 0
 atmo.Sun_SetTexture GetTex("sun")
 atmo.Sun_SetColor 1, 1, 1, 1
 'atmo.LensFlare_Enable True
 'atmo.LensFlare_SetLensNumber 4
 'For l = 1 To 4
 'atmo.LensFlare_SetLensParams i, GetTex("flare" & CStr(i)), 10, 0.5, RGBA(1, 1, 1, 0.7)
 'Next
'///////////////////////����,�ؼ�/////////////////////////////








Set scene = New TVScene
scene.SetShadowParameters RGBA(0, 0, 0, 0.3), True
scene.SetTextureFilter TV_FILTER_TRILINEAR
scene.SetShadeMode TV_SHADEMODE_PHONG






'/////////////////////��������ϵͳ//////////////////////////////
Set inputE = New TVInputEngine
inputE.Initialize True, True





'//////////////////////////��ʼ���////////////////////////

Randomize
Set StartTunnel = scene.CreateMeshBuilder("StartTunnel")
With StartTunnel
.LoadTVM App.Path & "\Mesh\StartTunnel.tvm", True, True
.SetMaterial GetMat("solid")
.SetPosition -600, 500, 700
.SetCollisionEnable True
.SetCullMode TV_DOUBLESIDED
.SetLightingMode TV_LIGHTING_BUMPMAPPING_TANGENTSPACE
End With








'////////////////////////////��ͨ�ܵ�
'Set Shader = scene.CreateShader("Shader")
'Shader.CreateFromEffectFile App.Path & "\SHADER.FX"
'Shader.SetAsGlobal True, TV_SHADEROBJECT_MESH, "Technique1"
'Shader.SetTechnique "Technique1"

For r = 1 To 15  '�ܵ�
Set NRWay(r) = scene.CreateMeshBuilder("runway" & CStr(r))
With NRWay(r)
        If r Mod 2 = 0 Then
        .LoadTVM App.Path & "\Mesh\NRW1.tvm", True, True
       Else
       .LoadTVM App.Path & "\Mesh\NRW2.tvm", True, True
       End If
.Enable True
'.SetShader GetShader("Shader")
.SetLightingMode TV_LIGHTING_BUMPMAPPING_TANGENTSPACE
.SetAlphaTest True, 96
.SetMaterial GetMat("solid") 'ÿ�������ö����Ĳ���
.SetCollisionEnable True
.SetCullMode TV_DOUBLESIDED
.SetBlendingMode TV_BLEND_ALPHA
.SetScale 1.5, 1, 1.5
End With
NRWPosZ(r) = 200 * Int(5 * Rnd(1) + 1)
NRWPosY(r) = -100 * Rnd(1) + 100
NRWay(r).SetPosition r * 450, NRWPosY(r), NRWPosZ(r)
Next r
NRWay(1).SetPosition 200, -500, 150
'NRWay(1).SetColor RGBA(1, 1, 1, 1)










Dim Sc As Single '���ű���
Randomize '���յ�ʯͷ
For a = 1 To 30
AstMP(a).RX = 0.5 * Rnd(1) '��ת����
AstMP(a).RY = 0.5 * Rnd(1)
AstMP(a).RZ = 0.5 * Rnd(1)
AstMP(a).MX = 0.1 * Rnd(1) '�ƶ�����
AstMP(a).MY = 0.1 * Rnd(1)
AstMP(a).MZ = 0.1 * Rnd(1)
Set Asteroid(a) = scene.CreateMeshBuilder("rock" & CStr(a))
Sc = 0.6 * Rnd(1) ^ 2
With Asteroid(a)
.LoadTVM App.Path & "\Mesh\rock1.tvm", True, True
.SetMaterial GetMat("asteroid")
.SetLightingMode TV_LIGHTING_NORMAL
.SetCollisionEnable False
.SetCullMode TV_DOUBLESIDED
.SetPosition 3000 + 3000 * Rnd(1), -700 * Rnd(1) + 800, 2000 * Rnd(1)
.SetScale Sc, Sc, Sc
End With
Next








HasFallNumber = 0
For r = 1 To 30 '��ʯȺ��Ϯ
FR(r).X = 0
FR(r).Y = 1000
FR(r).Z = 1500 * Rnd(1)
FR(r).StartX = 0 '����ʱ����ʼ����
FR(r).StartY = 0
FR(r).StartZ = 0
FR(r).FR_Scale = 3 * Rnd(1) ^ 2
Set FR(r).Mesh = scene.CreateMeshBuilder("FR" & CStr(r))
With FR(r).Mesh
.LoadTVM App.Path & "\Mesh\FallingRock.tvm", True, True '.FallingRock.tvm"
.SetPosition FR(r).X, FR(r).Y, FR(r).Z
.SetScale FR(r).FR_Scale, FR(r).FR_Scale, FR(r).FR_Scale
.SetCullMode TV_FRONT_CULL
.SetLightingMode TV_LIGHTING_NORMAL
.SetCollisionEnable True
.SetMaterial GetMat("asteroid")
End With
Next r







For r = 1 To 70  'RMB
RmbPosZ(r) = NRWay(r Mod 14 + 1).GetPosition.Z - 50 + 100 * Rnd(1) 'RUNWAY�������ȡZ
RmbPosX(r) = NRWay(r Mod 14 + 1).GetPosition.X + (70 * (r Mod 5)) '�ų�һ��
Set RMB(r) = scene.CreateBillboard(GetTex("RMB50"), RmbPosX(r), NRWay((r Mod 14) + 1).GetPosition.Y + 60, RmbPosZ(r), 50, 25)
RMB(r).SetBillboardType TV_BILLBOARD_NOROTATION
RMB(r).SetBlendingMode TV_BLEND_ALPHA
RMB(r).SetCullMode TV_DOUBLESIDED
RMB(r).SetCollisionEnable False
RMB(r).SetLightingMode TV_LIGHTING_NORMAL
'RMB(r).SetMaterial GetMat("solid")
RMB(r).SetColor RGBA(0.5, 0.6, 0.5, 1), True
Next r





'NGAColor.r = 0.6
'NGAColor.g = 0.8
'NGAColor.b = 1
'NGAColor.a = 0.2

Set NGALaser = scene.CreateMeshBuilder("NGALaser")
With NGALaser
.LoadTVM App.Path & "\Mesh\NGALaser.tvm"
.SetPosition -10000, 200, 1000
.SetBlendingMode TV_BLEND_ADDALPHA
.SetLightingMode TV_LIGHTING_NONE
.SetCullMode TV_DOUBLESIDED
.SetCollisionEnable True
.SetScale 5, 5, 5
End With






For r = 1 To 30
Set ExplosionAnimation(r) = scene.CreateBillboard(GetTex("Explosion"), 0, 300, 500, 400, 400)
With ExplosionAnimation(r)
.SetLightingMode TV_LIGHTING_NONE
.SetCullMode TV_FRONT_CULL
.SetBillboardType TV_BILLBOARD_YAXIS
.SetAlphaTest True, 300
.SetCollisionEnable False
End With
Next r





'////////////////////////////�������
Set SpeedUpTunnel = scene.CreateMeshBuilder("SpeedUpTunnel") '�������
With SpeedUpTunnel
.LoadTVM App.Path & "\Mesh\SpeedTunnel.tvm", True, True
.SetLightingMode TV_LIGHTING_BUMPMAPPING_TANGENTSPACE
.SetMaterial GetMat("solid")
.SetCollisionEnable True
.SetCullMode TV_DOUBLESIDED
.SetPosition -10000, 500, 0
End With


Set SpeedDownTunnel = SpeedUpTunnel.Duplicate("SpeedDownTunnel", True)   '��share��share memory�п�����
SpeedDownTunnel.SetPosition -10000, 500, 1500


Set SpeedTunnelRing(1) = scene.CreateActor("SpeedTunnelRing1")
With SpeedTunnelRing(1)
.LoadTVA App.Path & "\Mesh\STRing.tva"
.SetLightingMode TV_LIGHTING_NORMAL
.SetCollisionEnable False
.SetAnimationByName "Rotate"
.SetCullMode TV_DOUBLESIDED
.SetAnimationLoop True
.SetPosition -10000, 500, 0
.SetScale 1, 0.8, 0.8
End With


Set SpeedTunnelRing(2) = SpeedTunnelRing(1).Duplicate("SpeedTunnelRing2")
SpeedTunnelRing(2).SetPosition -10000, 500, 1500





'///////////////////////////����
Randomize
Set GameTools.Magnet_Mesh = scene.CreateMeshBuilder("Magnet")
With GameTools.Magnet_Mesh
.LoadTVM App.Path & "\Mesh\Magnet.tvm"
.SetPosition 10000 + 1000 * Rnd(1), 300, 500
.SetLightingMode TV_LIGHTING_NONE
.SetCollisionEnable False
.SetCullMode TV_DOUBLESIDED
End With

'//////////////////////////���� ��Ѫ
Set GameTools.RecoverHP_Mesh = scene.CreateMeshBuilder("HeartMesh")
With GameTools.RecoverHP_Mesh
.LoadTVM App.Path & "\Mesh\Heart.tvm"
.SetPosition 5000, 300, 800
.SetScale 2, 2, 2
.SetLightingMode TV_LIGHTING_NONE
.SetCollisionEnable False
End With

'/////////////////////////CLOCK ��
Set GameTools.TimeSlow_Mesh = scene.CreateMeshBuilder("Clock")
With GameTools.TimeSlow_Mesh
.LoadTVM App.Path & "\Mesh\Clock.tvm"
.SetPosition 7000, 300, 1000
.SetScale 5, 5, 5
.SetLightingMode TV_LIGHTING_NONE
.SetCollisionEnable False
End With






'//////////////////////����money�ܵ�
Set MoneySaveRunway = scene.CreateMeshBuilder("MoneySaveRunway")
With MoneySaveRunway
.LoadTVM App.Path & "\Mesh\MoneySaveRunway.tvm"
.SetLightingMode TV_LIGHTING_BUMPMAPPING_TANGENTSPACE
.SetCollisionEnable True
.SetMaterial GetMat("solid")
.SetPosition 10000 + 10000 * Rnd(1), 350, 1200
End With



'/////////////////////////////////////����ϵͳ
Set PickMoneyParticle(1) = scene.CreateParticleSystem("PickMoney1")
PickMoneyParticle(1).Load App.Path & "\Mesh\PS\PickMoney.tvp"
PickMoneyParticle(1).SetEmitterLooping 1, False
For P = 2 To 70
Set PickMoneyParticle(P) = PickMoneyParticle(1).Duplicate("PickMoney" & CStr(P))
Next P


Set LittleRock = scene.CreateParticleSystem("LittleRock")
LittleRock.Load App.Path & "\Mesh\PS\LittleRock.tvp"


For r = 1 To 30
Set ExplosionParticle(r) = scene.CreateParticleSystem("ExplosionParticle" & CStr(r))
ExplosionParticle(r).Load App.Path & "\Mesh\PS\Explosion.tvp"
Next r


Set NoGravityArea = scene.CreateParticleSystem("NoGravityArea")
NoGravityArea.Load App.Path & "\Mesh\PS\NoGravityArea.TVP"
NoGravityArea.SetGlobalPosition -10000, 100, 1000


Set SpeedUpParticle = scene.CreateParticleSystem("SpeedUpParticle")
SpeedUpParticle.Load App.Path & "\Mesh\PS\SpeedUp.TVP" 'Ring1�Ǽ��� ���ұ�
SpeedUpParticle.SetGlobalPosition SpeedTunnelRing(1).GetPosition.X, SpeedTunnelRing(1).GetPosition.Y, SpeedTunnelRing(1).GetPosition.Z



Set SpeedDownParticle = scene.CreateParticleSystem("SpeedDownParticle")
SpeedDownParticle.Load App.Path & "\Mesh\PS\SpeedDown.TVP" 'Ring2�Ǽ��� ����� �����
SpeedDownParticle.SetGlobalPosition SpeedTunnelRing(2).GetPosition.X, SpeedTunnelRing(2).GetPosition.Y, SpeedTunnelRing(2).GetPosition.Z

'Set SpaceFog = scene.CreateParticleSystem("SpaceFog")
'SpaceFog.Load App.Path & "\Mesh\Fog.tvp"





'///////////////////////////////////////////////////////
'//////////////////////////UI�����֣�//////////////////
'//////////////////////////��ť/////////////////////////
'///////////////////////////////////////////////////////
For a = 1 To 4 '�˵���4����ť
With Button(a)
'.MouseStatus = Button_MouseNotOn
.MouseHasClick = False
.MouseIsOn = False
.LeftTop_X1 = 700 - a * 80
.LeftTop_Y1 = 100 + a * 120
.Width = 200
.Height = 80
End With
Next a

'���� ��������3����ť
For a = 5 To 7
With Button(a)
.MouseHasClick = False
.MouseIsOn = False
.LeftTop_X1 = 0 '��������
.LeftTop_Y1 = 600
.Width = 200
.Height = 80
End With
Next a

'�̵�İ�ť
For a = 8 To 11
With Button(a)
.MouseHasClick = False
.MouseIsOn = False
.LeftTop_X1 = 600 '��������
.LeftTop_Y1 = -700 + a * 100
.Width = 200
.Height = 80
End With
Next a
Button(11).LeftTop_Y1 = 600



'���õİ�ť
For a = 12 To 16
With Button(a)
.MouseHasClick = False
.MouseIsOn = False
End With
Next
Button(12).Width = 80 '�����ȼ�
Button(12).Height = 80
Button(12).LeftTop_X1 = 400
Button(12).LeftTop_Y1 = 200

Button(13).Width = 80 '�����ȼ�
Button(13).Height = 80
Button(13).LeftTop_X1 = 600
Button(13).LeftTop_Y1 = 200

Button(14).Width = 80 '��Ч��
Button(14).Height = 80
Button(14).LeftTop_X1 = 400
Button(14).LeftTop_Y1 = 400
Button(15).Width = 80 '��Ч��
Button(15).Height = 80
Button(15).LeftTop_X1 = 600
Button(15).LeftTop_Y1 = 400

Button(16).Width = 300 '����
Button(16).Height = 120
Button(16).LeftTop_X1 = 400
Button(16).LeftTop_Y1 = 600



For a = 17 To 19 '��ͣ�˵�
With Button(a)
.MouseHasClick = False
.MouseIsOn = False
.LeftTop_X1 = 550 '��������
.LeftTop_Y1 = 100 + 100 * (a - 16)
.Width = 200
.Height = 80
End With
Next a

'/////////////////////2D��ͼ///////////////////////////////

Set SCR = New TVScreen2DImmediate
Set SCRText = New TVScreen2DText
SCRText.NormalFont_Create "С��", "����������W5(P)", 36, True, False, False '"����������W5(P)"
SCRText.NormalFont_Create "С��", "����������W5(P)", 72, True, False, False
SCRText.NormalFont_Create "С��", "����������W5(P)", 24, True, False, False
SCRText.NormalFont_Create "С��", "����������W5(P)", 18, True, False, False


'��ʼ���ᵭ��������
ScrTextAlpha(1).FadeOutSpeed = 0.001 'С���
ScrTextAlpha(2).FadeOutSpeed = 0.001 'RMB50
ScrTextAlpha(3).FadeOutSpeed = 0.0005 'RMB1000
ScrTextAlpha(4).FadeOutSpeed = 0.0002 '��齱��ģʽ
ScrTextAlpha(5).FadeOutSpeed = 0.0002 '������ģʽ
ScrTextAlpha(6).FadeOutSpeed = 0.0003 'ײ��ʯͷ
ScrTextAlpha(7).FadeOutSpeed = 0.0003 'ˤ����
ScrTextAlpha(8).FadeOutSpeed = 0.0003 '������
ScrTextAlpha(9).FadeOutSpeed = 0.0003 '����ʯ
ScrTextAlpha(10).FadeOutSpeed = 0.0003 '�����������
ScrTextAlpha(11).FadeOutSpeed = 0.0002  'ʯ��ᶯ
ScrTextAlpha(12).FadeOutSpeed = 0.0002 '�õ�����
ScrTextAlpha(13).FadeOutSpeed = 0.0005 '��Ǯ
ScrTextAlpha(14).FadeOutSpeed = 0.0005 '����Ѫ
ScrTextAlpha(15).FadeOutSpeed = 0.001 '����δ��ȴ
ScrTextAlpha(16).FadeOutSpeed = 0.0002 '�����Զ���Ǯ
ScrTextAlpha(17).FadeOutSpeed = 0.001 'HP����
ScrTextAlpha(18).FadeOutSpeed = 0.0005 '�Ϳ�ʱ��ӳ�
ScrTextAlpha(19).FadeOutSpeed = 0.0002 'ʱ������
ScrTextAlpha(20).FadeOutSpeed = 0.001 '�ѽ���

SpeedUpParticle.SetGlobalPosition SpeedTunnelRing(1).GetPosition.X, SpeedTunnelRing(1).GetPosition.Y, SpeedTunnelRing(1).GetPosition.Z
SpeedDownParticle.SetGlobalPosition SpeedTunnelRing(2).GetPosition.X, SpeedTunnelRing(2).GetPosition.Y, SpeedTunnelRing(2).GetPosition.Z






CamViewDegree = 60
Set cam = New TVCamera
cam.SetViewFrustum CamViewDegree, 7000
cam.SetCamera camX, camY, camZ, CamLX, CamLY, CamLZ




'///////////////////////////////////����
'///////////////////////////////////����
'///////////////////////////////////����
Set SOUNDE = New TVSoundEngine
SOUNDE.Init Form1.Picture1.hwnd

Randomize
'��ϷBGM
For a = 1 To 3
Set GameBGM(a) = New TVSoundMP3
GameBGM(a).Load App.Path & "\Music\G_BGM" & CStr(a) & ".mp3"
GameBGM(a).Volume = -800
Next a
GameBGMID = Int(3 * Rnd(1)) + 1
GameBGM(GameBGMID).PlayPosition = 0


'���˵�BGM
Set MenuBGM = New TVSoundMP3
MenuBGM.Load App.Path & "\Music\M_BGM.MP3"
MenuBGM.Play
MenuBGM.Volume = -200


With GameSound
Set .Eject_Boost = New TVSoundMP3
Set .Eject_Charge = New TVSoundMP3
Set .Engine = New TVSoundMP3
Set .HeartBeat = New TVSoundMP3
Set .Scream = New TVSoundMP3
Set .GetTools = New TVSoundMP3

.HeartBeat.Load App.Path & "\Music\HeartBeat.MP3"
.HeartBeat.Volume = -50

.Scream.Load App.Path & "\Music\Scream.MP3"
.Scream.Volume = -200

.Eject_Boost.Load App.Path & "\Music\Ejection_Boost.MP3"
.Eject_Boost.Volume = -1000

.Eject_Charge.Load App.Path & "\Music\EjectionCharging.MP3"
.Eject_Charge.Volume = -1000

.GetTools.Load App.Path & "\Music\GetTools.MP3"
.GetTools.Volume = -1000


For a = 1 To 70
       Set .Coin(a) = New TVSoundMP3
       .Coin(a).Load App.Path & "\Music\Coin.MP3"
Next a


For a = 1 To 30
Set .Explode(a) = New TVSoundMP3
.Explode(a).Load App.Path & "\Music\EXP2.MP3"
.Explode(a).Volume = -100
Next a

End With



'///////////////////////////////����///////////////////////////
'Set GlowRS = scene.CreateRenderSurfaceEx(-1, -1, TV_TEXTUREFORMAT_DEFAULT, True, True)
'GE.InitGlowEffect GlowRS
'GE.SetGlowParameters  TVColor(1, 1, 1, 0.5), 1, 2   '��ɫ��ǿ�ȣ�ģ����
' Set DeepRS = scene.CreateRenderSurfaceEx(-1, -1, CONST_TV_RENDERSURFACEFORMAT.TV_TEXTUREFORMAT_A8R8G8B8, True, True)     '����ͼ��
'GE.InitDepthOfField 8, DeepRS   '  ����Ĳ���������Խ��Խ��ϸ
'GE.SetDepthOfFieldParameters 5, 3, 2       '������롢������롢ģ���̶�

GE.FadeIn 500
End Sub










Public Sub ���³�ʼ������() '�������¿�ʼ ����ҪSet

Vcam = 10 '�ٶ�
Scam = 0 '·��
camX = -400
camY = 550
camZ = 700
CamLX = 200
CamLY = 550
CamLZ = 700
HP = 100
VY = 0 '�����ٶ�
RotateX = 1.57 '�������� �ӵ�
RotateY = 0
SunSize = 2 '�Ǹ�����Ĵ�С
RMBRotateY = 0 '��ת�ľ��ԽǶ�
MoneyMultiplier = 1 '���� Ǯ�ı���
UnSavedCashInGame = 0 '��Ϸ��û���Ǯ
GameScore = 0 '����
HaveSavedMoney = False
StayInAirTime = 0
TimePassSpeed = 1
'CoinSoundID = 1
'diecounttime = 0 '�����˵��ļ�ʱ��

SE.EventReBoostTime = 20000 '����
SE.EventCountTime = 0
SE.EventActivated = False
NoGravityActivated = False

NextPlayLevelToGo = 0 '�ڲ˵������õ� ��Ϊ��ͻ�PLAYLEVEL


ShockActivated = False
HasJumped = 0

CanPressW = True

VR = 0
F���� = 1 '���ϵ�1�����е�С��ģ�����
IsDead = False





For r = 1 To 15
NRWPosZ(r) = 200 * Int(5 * Rnd(1) + 1)
NRWPosY(r) = -100 * Rnd(1) + 100
NRWay(r).SetPosition r * 450, NRWPosY(r), NRWPosZ(r)
Next r
NRWay(1).SetPosition 200, -500, 150


Dim Sc As Single '���ű���
Randomize '���յ�ʯͷ
For a = 1 To 30
AstMP(a).RX = 0.5 * Rnd(1) '��ת����
AstMP(a).RY = 0.5 * Rnd(1)
AstMP(a).RZ = 0.5 * Rnd(1)
AstMP(a).MX = 0.1 * Rnd(1) '�ƶ�����
AstMP(a).MY = 0.1 * Rnd(1)
AstMP(a).MZ = 0.1 * Rnd(1)
Sc = 0.6 * Rnd(1) ^ 2
With Asteroid(a)
.SetPosition 3000 + 3000 * Rnd(1), -700 * Rnd(1) + 800, 2000 * Rnd(1)
.SetScale Sc, Sc, Sc
.SetMaterial GetMat("asteroid")
.SetTexture GetTex("Rock")
End With
Next a


HasFallNumber = 0
For r = 1 To 30 '��ʯȺ��Ϯ
FR(r).X = 0
FR(r).Y = 1000
FR(r).Z = 1500 * Rnd(1)
FR(r).StartX = 0 '����ʱ����ʼ����
FR(r).StartY = 0
FR(r).StartZ = 0
FR(r).FR_Scale = 3 * Rnd(1) ^ 2
With FR(r).Mesh
.SetPosition FR(r).X, FR(r).Y, FR(r).Z
.SetScale FR(r).FR_Scale, FR(r).FR_Scale, FR(r).FR_Scale
End With
Next r


For r = 1 To 70  'RMB
RmbPosZ(r) = NRWay(r Mod 14 + 1).GetPosition.Z - 50 + 100 * Rnd(1) 'RUNWAY�������ȡZ
RmbPosX(r) = NRWay(r Mod 14 + 1).GetPosition.X + (70 * (r Mod 5)) '�ų�һ��
RMB(r).SetPosition RmbPosX(r), NRWay((r Mod 14) + 1).GetPosition.Y + 60, RmbPosZ(r)
Next r




NGALaser.SetPosition -10000, 200, 1000
SpeedUpTunnel.SetPosition -10000, 200, 1000
SpeedDownTunnel.SetPosition -10000, 500, 0
SpeedTunnelRing(1).SetPosition -10000, 500, 0
SpeedTunnelRing(2).SetPosition -10000, 500, 1500
SpeedUpParticle.ResetAll
SpeedUpParticle.SetGlobalPosition -10000, 0, 0
SpeedDownParticle.ResetAll
SpeedDownParticle.SetGlobalPosition -10000, 0, 0
NoGravityArea.ResetAll
NoGravityArea.SetGlobalPosition -10000, 0, 0


'��Ϸ����
Randomize
GameTools.Magnet_Mesh.SetPosition 10000 + 10000 * Rnd(1), 300, 1200
GameTools.RecoverHP_Mesh.SetPosition 20000, 300, 800
GameTools.TimeSlow_Mesh.SetPosition 5000 + 5000 * Rnd(1), 300, 1000
GameTools.MoneySave_HasSavedTime = 0
GameTools.MoneySave_IsUsing = False
GameTools.Magnet_IsPlayerHas = False
GameTools.Magnet_OnHandTime = 0
GameTools.Eject_IsUsingSystem = False
GameTools.Eject_Step = 1
GameTools.Eject_HasStartTime = 0
GameTools.TimeSlow_IsPlayerHas = False
GameTools.TimeSlow_OnHandTime = 0
MoneySaveRunway.SetPosition 10000 + 10000 * Rnd(1), 350, 1200

KeyCountTime.Key_Space_Time = 0
KeyCountTime.Key_LeftCtrl_Time = 0
KeyCountTime.Key_PrintScreen = 0

cam.SetViewFrustum CamViewDegree, 7000
cam.SetCamera camX, camY, camZ, CamLX, CamLY, CamLZ

End Sub

