Attribute VB_Name = "����"
Public Declare Function AddFontResource Lib "gdi32" Alias "AddFontResourceA" (ByVal lpFileName As String) As Long
Public Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
'����
Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long


Public Shader As TVShader




Enum ButtonStatus
Button_MouseNotOn = 1
Button_MouseOn = 2
Button_IsClicked = 3
End Enum




'////////////////////////////////////////����
'////////////////////////////////////////����
'////////////////////////////////////////����
'////////////////////////////////////////����
Public SOUNDE As TVSoundEngine
Public GameBGM(1 To 3) As TVSoundMP3
Public MenuBGM              As TVSoundMP3
Public GameBGMID            As Integer
'Public CoinSoundID          As Integer
'Public CoinSoundCountTime          As Single

Public Type GameSoundType
Explode(1 To 30)                            As TVSoundMP3
Engine                              As TVSoundMP3
Coin(1 To 70)                               As TVSoundMP3
Scream                             As TVSoundMP3
HeartBeat                          As TVSoundMP3
Eject_Charge                       As TVSoundMP3
Eject_Boost                           As TVSoundMP3
GetTools                                As TVSoundMP3
End Type
Public GameSound As GameSoundType






'///////////////////////////////////////////�����¼�
Public SE                    As SpecialEvent

Enum SpecialEventID '�����¼�ID
SpecialEvent_NoGravityArea = 1 '��������
SpecialEvent_RockFall = 2  '��ʯȺ
SpecialEvent_SpeedTunnel = 3  '�Ӽ������
SpecialEvent_Gold = 4 '����ʯ
'�����Ǹ��ƶ�ʯ��ռ��5
End Enum

Public Type SpecialEvent
EventID                      As SpecialEventID
EventReBoostTime             As Single
EventCountTime               As Single
EventActivated               As Boolean
End Type
'////////////////////////////////////////////////






'//////////////////////////////////////////////////////////////////
Public FR(1 To 30)           As FallingRock '׹�����ʯ
Public ExplosionAnimation(1 To 30)    As TVMesh
Public FRHasFallNumber       As Single '��ʯ�����µ���Ŀ
Public FallingRock(1 To 30)  As TVMesh
Public Type FallingRock

FR_Scale                     As Single
X                            As Single
Y                            As Single
Z                            As Single
StartX                       As Single
StartY                       As Single
StartZ                       As Single
Mesh                         As TVMesh
End Type

'//////////////////////////////////////////////








'/////////////////////////'��Щ���ŵ���ʯ
Public Asteroid(1 To 30)     As TVMesh
Public AstMP(1 To 30)        As AsteroidMoveParam 'Asteroid Move Parameters

Public Type AsteroidMoveParam
MX                           As Single
MY                           As Single
MZ                           As Single
RX                           As Single 'rotateX
RY                           As Single
RZ                           As Single
AbsRX                        As Single 'Absolute Rotate X
AbsRY                        As Single
AbsRZ                        As Single
End Type

'//////////////////////////////////////////////






'/////////////////////////////////////////�����= =
Public RMB(1 To 70)         As TVMesh
Public RmbPosZ(1 To 70)      As Single
Public RmbPosX(1 To 70)      As Single
Public RmbIsMagnetic(1 To 70) As Boolean

Enum RMMode '�������ģʽ
ResetMode_Normal = 0
ResetMode_Random = 1
End Enum
'//////////////////////////////////////////////










'/////////////////////////////////////////////////
Public Type UIButton
MouseIsOn                   As Boolean
MouseHasClick               As Boolean
LeftTop_X1                  As Single
LeftTop_Y1                  As Single
Width                              As Single
Height                             As Single
MouseStatus                 As ButtonStatus
End Type
'/////////////////////////////////////////////////









'////////////////////////////////����������
Public Type UIScrTextAlpha
FadeOutSpeed                As Single '�������ٶ�
Alpha                       As Single
End Type

'//////////////////��һ������������4��
'////////////////1��ö����Ӷ�һ����Ŀ
'///////////////2����ʼ���趨�����ٶ�
'///////////////3�������¼�ʱ�趨ALPHAΪ1
'//////////////4����ͼ2D���ﻭͼ

Public Enum ScrTextName
Text_С��� = 1
Text_�����50 = 2
Text_�����1000 = 3
Text_��齱��ģʽ = 4
Text_������ģʽ = 5
text_ײ����ʯ = 6
text_ˤ���� = 7
text_������ = 8
text_С����ʯ = 9
text_����������� = 10
text_ʯ��ᶯ = 11
text_�õ����� = 12
text_��Ǯ = 13
text_��Ѫ = 14
text_����δ��ȴ = 15
text_�����Զ���Ǯϵͳ = 16
text_HP���� = 17
text_�Ϳ�ʱ��ӳ� = 18
text_ʱ�������ٶ� = 19
text_�ѽ��� = 20
End Enum













Public Playlevel             As Integer '������ĳ��� ��case
Public NextPlayLevelToGo  As Integer 'һ��ʼ�˵� �Ƿ񵭳����Ȼ����Լ���
Public PlayLevelBeforeSetting        As Integer
Public HP                    As Single '���Ѫ��
Public GameScore             As Double '��Ϸ����
Public HighScore               As Double


Public TV                    As New TVEngine
Public inputE                As New TVInputEngine
Public scene                 As New TVScene
Public cam                   As New TVCamera
Public texF                  As New TVTextureFactory
Public atmo                  As New TVAtmosphere
Public LE                    As New TVLightEngine
Public MatF                  As New TVMaterialFactory
Public GE                    As New TVGraphicEffect
Public SCR                   As New TVScreen2DImmediate
Public SCRText               As New TVScreen2DText
Public GlowRS                As New TVRenderSurface '����ͼ��
Public DeepRS                As New TVRenderSurface '����



 '//////////////////////////NormalRunway��ͨ�ܵ�
Public NRWay(1 To 15)        As TVMesh
Public NRWPosZ(1 To 15)      As Single
Public NRWPosY(1 To 15)      As Single

'///////////////////////����ϵͳ
Public LittleRock            As TVParticleSystem
Public PickMoneyParticle(1 To 70) As TVParticleSystem
Public ExplosionParticle(1 To 30) As TVParticleSystem '��ը��ʱ��



Public NoGravityArea         As TVParticleSystem
Public NGALaser              As TVMesh

'Public NGAColor              As TV_COLOR '����������Color

'////////////////////////////�������
Public StartTunnel           As TVMesh '��ʼ���
Public SpeedUpTunnel         As TVMesh '�������
Public SpeedDownTunnel       As TVMesh '�������
Public SpeedTunnelRing(1 To 2) As TVActor 'ת����
Public SpeedUpParticle      As TVParticleSystem
Public SpeedDownParticle    As TVParticleSystem



'///////////////////////////����Money�ܵ�
Public MoneySaveRunway      As TVMesh
Public MoneyMultiplier      As Integer
Public HaveSavedMoney       As Boolean
Public UnSavedCashInGame    As Long 'û���money
Public TotalCash            As Long




'///////////////////////////��Ϸ����
Public Type GameToolsType
Magnet_IsPlayerHas                    As Boolean
Magnet_OnHandTime                 As Single
Magnet_Mesh                               As TVMesh
Eject_TheNumberPlayerHas       As Integer
Eject_IsUsingSystem                     As Boolean
Eject_Step                                       As Integer
Eject_HasStartTime                        As Single
MoneySave_TheNumberPlayerHas   As Integer
MoneySave_IsUsing                         As Boolean
MoneySave_HasSavedTime             As Single '���ϴδ�Ǯ�ѹ���ʱ��
HP_InShop_TheNumberPlayerHas   As Integer
RecoverHP_Mesh                            As TVMesh
TimeSlow_IsPlayerHas                      As Boolean
TimeSlow_OnHandTime                As Single
TimeSlow_Mesh                             As TVMesh
End Type


Public GameTools As GameToolsType 'ʵ����









'////////////////////////////////////////

Public Vcam                  As Single '�ٶ�
Public Scam                  As Single '·��
Public camX                  As Single
Public camY                  As Single
Public camZ                  As Single
Public CamLX                 As Single
Public CamLY                 As Single
Public CamLZ                 As Single
Public DeltaCamZ             As Single
Public DeltaCamY             As Single
Public VY                    As Single '�����ٶ�
Public F����                 As Single
Public DeltaVConst           As Single '�ٶȳ��� ƽ��FPS��ͬ��ɵ����
Public StayInAirTime        As Single '�Ϳ�ʱ�� ���ڼӳ�
Public StayInAirBonus       As Long

Public FormCenterX           As Single '�������ĵ�X
Public FormCenterY           As Single 'Y
Public FormHeight            As Single
Public FormWidth             As Single

'Public FRColRes(1 To 30)          As TV_COLLISIONRESULT



Public VR                    As Single 'Right����
Public RotateX               As Single
Public RotateY               As Single
Public IsDead                As Boolean
Public SunSize               As Single '�Ǹ�������Ĵ�С
Public RMBRotateY            As Single
Public tmpmouseX             As Long '
Public tmpmouseY             As Long
Public MouseX                As Long '�������� ����
Public MouseY                As Long

Public HasJumped             As Integer
Public CanPressW             As Boolean
Public HasPressWTime         As Single '����һ�ΰ����˶��




'//////////////////////UI������
Public ScrTextAlpha(1 To 20)        As UIScrTextAlpha 'Ԥ��20����λ��
Public Button(1 To 20)               As UIButton 'Ԥ��15����λ





'.////////////////////////////////////////////���ܺ���////////////////////////
'.////////////////////////////////////////////////////////////////////
'.////////////////////////////////////////////////////////////////////
'.////////////////////////////////////////////////////////////////////
'
Public N_X                   As Single
Public N_Y                   As Single
Public N_Z                   As Single





'////////////////MoveCam
Public CamMoveX              As Single
Public CamMoveY              As Single
Public CamMoveZ              As Single
Public CamPosMoveFinish      As Boolean
Public CamLookatMoveFinish   As Boolean
Public CamMoveLX             As Single
Public CamMoveLY             As Single
Public CamMoveLZ             As Single
Public CamViewDegree         As Single





'///////////////����
Public ShockTime             As Single
Public ShockTimeOnce         As Single
Public ShockActivated        As Boolean




'//////////////////��ը����
Public Type ExplosionAnimationType
CountTime                   As Single
TextureID                   As Integer 'ֻ����������е��е�ID
Activated                   As Boolean
End Type
Public ExpAnim(1 To 30)     As ExplosionAnimationType


'/////////////////////�����¼� speedTunnel
Public SpeedTunnelX         As Single


'/////////////////////�����¼� NoGravityArea
Public NoGravityActivated   As Boolean


'/////////////////////�����¼� GOLD
Public Gold_BonusCash            As Single
Public SE_Gold_LastTime     As Single 'BONUSģʽ���˶��


'////////////////////////�����¼� ʯ���ƶ�
Public RockHasMove_Time          As Single 'ʯ�鿪ʼ���˶��
Public RockHasMove_Rounds        As Single 'ʯ�����˶��ٸ�����
Public TmpNRWayPosZ(1 To 15)     As Single
Public MoveDifferenceConst(1 To 15) As Single 'ʹ���ǵ�������ʼ��ͬ







'/////////////////////////��ͼ 2D��� ��������ת��������2D��
Public MoneySave2DPointX As Single, MoneySave2DPointY As Single
Public SpeedUpDPointX As Single, SpeedUp2DPointY      As Single
Public SpeedDownDPointX As Single, SpeedDown2DPointY  As Single
Public Fr2DX(1 To 30) As Single, Fr2DY(1 To 30)       As Single


'//////////////////////////��ͼ2D ������
Public DieMenuCountTime                     As Single '��ʱ����


'////////////////////////////��ͼ2D �̵�
Public AfterPressCountTime                  As Single










'//////////////////�浵
Public EnCryptionFlag As Integer
Public DeCryptionFlag As Integer

Enum DataInputSaveMode
DataType_SettingData = 1 '���õ�����
DataType_PlayerData = 2 '�������
End Enum




'////////////////////���ò���
Public Type GameSettingsType
MouseSensitivity As Single
IsSoundOn        As Integer
End Type
Public GameSettings As GameSettingsType






'//////////////////////���ⰴ�������ʹ��
Public Type AfterPressKeyCountTime
Key_Space_Time       As Single
Key_LeftCtrl_Time    As Single
Key_PrintScreen      As Single
Key_PageDown          As Single
End Type

Public KeyCountTime As AfterPressKeyCountTime



'/////////////////////��Ϸ�ٶ�ϵ�� ��������
Public TimePassSpeed        As Single 'Ĭ��ֵΪ1
