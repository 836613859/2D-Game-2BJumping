VERSION 5.00
Begin VB.Form monster 
   BackColor       =   &H80000012&
   Caption         =   "��������- -~"
   ClientHeight    =   6210
   ClientLeft      =   60
   ClientTop       =   600
   ClientWidth     =   8535
   LinkTopic       =   "Form1"
   ScaleHeight     =   6210
   ScaleWidth      =   8535
   StartUpPosition =   3  '����ȱʡ
   Begin VB.CommandButton Command1 
      Caption         =   "����"
      Height          =   495
      Left            =   4200
      TabIndex        =   4
      Top             =   3840
      Width           =   2055
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "C�����հ�"
      BeginProperty Font 
         Name            =   "����"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000FF&
      Height          =   375
      Left            =   4080
      TabIndex        =   3
      Top             =   2880
      Width           =   2415
   End
   Begin VB.Label Label3 
      BackStyle       =   0  'Transparent
      Caption         =   "B����ǯ"
      BeginProperty Font 
         Name            =   "����"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FFFF&
      Height          =   375
      Left            =   3000
      TabIndex        =   2
      Top             =   2160
      Width           =   2535
   End
   Begin VB.Label Label2 
      BackStyle       =   0  'Transparent
      Caption         =   "A������"
      BeginProperty Font 
         Name            =   "����"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H0000FF00&
      Height          =   375
      Left            =   1920
      TabIndex        =   1
      Top             =   1320
      Width           =   2295
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "- -~"
      BeginProperty Font 
         Name            =   "����"
         Size            =   15
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H8000000E&
      Height          =   375
      Left            =   360
      TabIndex        =   0
      Top             =   360
      Width           =   7335
   End
   Begin VB.Image Image1 
      Height          =   6000
      Left            =   120
      Picture         =   "����-��ȭ.frx":0000
      Top             =   120
      Width           =   8250
   End
End
Attribute VB_Name = "monster"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

Dim player_select
Dim wl, res
Dim lie_truth

Private Sub Command1_Click()
Call Form_Load
End Sub

Private Sub Form_Load()
res = Fix(Rnd * (Right(Time, 2)) + 1) Mod 3
lie_truth = Right(Time, 1) Mod 2

If res = 0 And lie_truth = 1 Then Label1 = "����˵������ο϶��� ���ܣ����ʲô��"
If res = 0 And lie_truth = 0 Then Label1 = "����˵������ο϶��� ��ǯ�����ʲô��"

If res = 1 And lie_truth = 1 Then Label1 = "����˵������ο϶��� ��ǯ�����ʲô��"
If res = 1 And lie_truth = 0 Then Label1 = "����˵������ο϶��� ���հ������ʲô��"

If res = 2 And lie_truth = 1 Then Label1 = "����˵������ο϶��� ���հ������ʲô��"
If res = 2 And lie_truth = 0 Then Label1 = "����˵������ο϶��� ���ܣ����ʲô��"
End Sub

Private Sub Label2_Click()
player_select = "a"
Call win_lose
End Sub

Private Sub Label3_Click()
player_select = "b"
Call win_lose
End Sub

Private Sub Label4_Click()
player_select = "c"
Call win_lose
End Sub
Private Sub win_lose()
If res = 0 And player_select = "a" Then wl = "the-same"
If res = 0 And player_select = "b" Then wl = "player-lose"
If res = 0 And player_select = "c" Then wl = "player-win"

If res = 1 And player_select = "a" Then wl = "player-win"
If res = 1 And player_select = "b" Then wl = "the-same"
If res = 1 And player_select = "c" Then wl = "player-lose"

If res = 2 And player_select = "a" Then wl = "player-lose"
If res = 2 And player_select = "b" Then wl = "player-win"
If res = 2 And player_select = "c" Then wl = "the-same"

If wl = "player-win" And lie_truth = 0 Then
MsgBox "��Ӯ�ˣ�"
MsgBox "���װB��ʶ����....."
Form1.Timer1.Enabled = True
Form1.Timer2.Enabled = True
Form1.Timer4.Enabled = True
Form1.Timer5.Enabled = True
Form1.Timer6.Enabled = True
Form1.Timer7.Enabled = True
Form1.Timer9.Enabled = True
Form1.Text3.Enabled = True
Form1.Label2.Enabled = True
Form1.Show

monster.Enabled = False
End If

If wl = "player-win" And lie_truth = 1 Then
MsgBox "��Ӯ�ˣ�"
MsgBox "������Ҷ��ʵ��"
Form1.Timer1.Enabled = True
Form1.Timer2.Enabled = True
Form1.Timer4.Enabled = True
Form1.Timer5.Enabled = True
Form1.Timer6.Enabled = True
Form1.Timer7.Enabled = True
Form1.Timer9.Enabled = True
Form1.Text3.Enabled = True
Form1.Label2.Enabled = True
Form1.Show

monster.Enabled = False
End If

If wl = "the-same" And lie_truth = 0 Then
MsgBox "��ƽ��"
MsgBox "���.........."
Form1.Picture1.Top = 20000
Form1.Timer2.Enabled = True
Form1.Label2.Enabled = True
Form1.Show
monster.Enabled = False
End If

If wl = "the-same" And lie_truth = 1 Then
MsgBox "��ƽ��"
MsgBox "���......."
Form1.Picture1.Top = 20000
Form1.Timer2.Enabled = True
Form1.Label2.Enabled = True
Form1.Show
monster.Enabled = False
End If

If wl = "player-lose" And lie_truth = 0 Then
MsgBox "��������", vbCritical
MsgBox "�����ʵ�ұ����Ǻܳ�ʵ��....��������鲻�Խ�....."
Form1.Picture1.Top = 20000
Form1.Timer2.Enabled = True
Form1.Label2.Enabled = True
Form1.Show
monster.Enabled = False
End If


If wl = "player-lose" And lie_truth = 1 Then
MsgBox "��������", vbCritical
MsgBox "����Ҷ�˵���ҳ�" & Mid(Label1, 12, 2) & "�ˣ����ֲ��ţ�"
Form1.Picture1.Top = 20000
Form1.Timer2.Enabled = True
Form1.Label2.Enabled = True
Form1.Show
monster.Enabled = False
End If
End Sub
