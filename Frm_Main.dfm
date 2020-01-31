object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Create HL7 Message (adt-a04) and Parse JSON'
  ClientHeight = 639
  ClientWidth = 1014
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object gbForm: TcxGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Align = alLeft
    Caption = 'Patient Information'
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -13
    Height = 633
    Width = 425
    object lblName: TcxLabel
      Left = 7
      Top = 21
      Caption = 'Name'
    end
    object edtName: TcxTextEdit
      Left = 129
      Top = 20
      TabOrder = 1
      Width = 157
    end
    object lblSurname: TcxLabel
      Left = 7
      Top = 45
      Caption = 'Surname'
    end
    object edtSurname: TcxTextEdit
      Left = 129
      Top = 44
      TabOrder = 3
      Width = 157
    end
    object lblMothersMaidenName: TcxLabel
      Left = 7
      Top = 68
      Caption = 'Mother'#39's Maiden Name'
    end
    object lblBirthDate: TcxLabel
      Left = 7
      Top = 93
      Caption = 'Birth Date'
    end
    object dtBirthDate: TcxDateEdit
      Left = 129
      Top = 92
      TabOrder = 6
      Width = 157
    end
    object edtMothersMaidenName: TcxTextEdit
      Left = 129
      Top = 68
      TabOrder = 7
      Width = 157
    end
    object btnFillDummyText: TcxButton
      Left = 320
      Top = 9
      Width = 102
      Height = 22
      Caption = 'Fill Dummy Text'
      TabOrder = 8
      OnClick = btnFillDummyTextClick
    end
    object lblSex: TcxLabel
      Left = 7
      Top = 118
      Caption = 'Sex'
    end
    object cmbSex: TcxImageComboBox
      Left = 129
      Top = 116
      Properties.Items = <
        item
          Description = 'Ambiguous'
          ImageIndex = 0
          Value = 'A'
        end
        item
          Description = 'Female'
          Value = 'F'
        end
        item
          Description = 'Male'
          Value = 'M'
        end>
      TabOrder = 10
      Width = 157
    end
    object cxLabel1: TcxLabel
      Left = 7
      Top = 142
      Caption = 'Race'
    end
    object cmbRace: TcxImageComboBox
      Left = 129
      Top = 140
      Properties.Items = <
        item
          Description = 'American Indian or Alaska Native'
          ImageIndex = 0
          Value = '1002-5'
        end
        item
          Description = 'Asian'
          Value = '2028-9'
        end
        item
          Description = 'Black or African American'
          Value = '2054-5'
        end
        item
          Description = 'Native Hawaiian or Other Pacific Islander'
          Value = '2076-8'
        end
        item
          Description = 'White'
          Value = '2106-3'
        end
        item
          Description = 'Other Race'
          Value = '2131-1'
        end>
      TabOrder = 12
      Width = 157
    end
    object gbAddressInformation: TcxGroupBox
      Left = 0
      Top = 188
      Caption = 'Address Information'
      TabOrder = 13
      Height = 101
      Width = 400
      object lblStreet: TcxLabel
        Left = 4
        Top = 21
        Caption = 'Street'
      end
      object edtStreet: TcxTextEdit
        Left = 67
        Top = 20
        TabOrder = 1
        Width = 136
      end
      object lblCity: TcxLabel
        Left = 219
        Top = 21
        Caption = 'City'
      end
      object edtCity: TcxTextEdit
        Left = 256
        Top = 20
        TabOrder = 3
        Width = 136
      end
      object lblPostCode: TcxLabel
        Left = 4
        Top = 45
        Caption = 'Post Code'
      end
      object edtPostCode: TcxTextEdit
        Left = 67
        Top = 44
        TabOrder = 5
        Width = 136
      end
      object lblCountry: TcxLabel
        Left = 209
        Top = 45
        Caption = 'Country'
      end
      object lblParishCode: TcxLabel
        Left = 4
        Top = 68
        Caption = 'Parish Code'
      end
      object edtParishCode: TcxTextEdit
        Left = 67
        Top = 68
        TabOrder = 8
        Width = 136
      end
      object cmbCountry: TcxImageComboBox
        Left = 256
        Top = 44
        Properties.Items = <
          item
            Description = 'Turkey'
            ImageIndex = 0
            Value = '90'
          end
          item
            Description = 'Denmark'
            Value = '45'
          end
          item
            Description = 'Croatia'
            Value = '385'
          end
          item
            Description = 'Spain'
            Value = '34'
          end>
        TabOrder = 9
        Width = 136
      end
    end
    object cxLabel2: TcxLabel
      Left = 7
      Top = 165
      Caption = 'Phone'
    end
    object edtPhone: TcxMaskEdit
      Left = 129
      Top = 164
      Properties.EditMask = '\(999\)000-0000'
      TabOrder = 15
      Text = '(   )   -    '
      Width = 157
    end
    object gbPatientVisit: TcxGroupBox
      Left = 3
      Top = 298
      Caption = 'Patient Visit Information'
      TabOrder = 16
      Height = 127
      Width = 400
      object lblPatientClass: TcxLabel
        Left = 4
        Top = 20
        Caption = 'Patient Class'
      end
      object cmbPatientClass: TcxImageComboBox
        Left = 126
        Top = 18
        Properties.Items = <
          item
            Description = 'Emergency'
            ImageIndex = 0
            Value = 'E'
          end
          item
            Description = 'Inpatient'
            Value = 'I'
          end
          item
            Description = 'Outpatient'
            Value = 'O'
          end>
        TabOrder = 1
        Width = 266
      end
      object lblHospitalService: TcxLabel
        Left = 4
        Top = 44
        Caption = 'Hospital Service'
      end
      object cmbHospitalService: TcxImageComboBox
        Left = 126
        Top = 42
        Properties.Items = <
          item
            Description = 'Cardiac Service'
            ImageIndex = 0
            Value = 'CAR'
          end
          item
            Description = 'Medical Service'
            Value = 'MED'
          end
          item
            Description = 'Pulmonary Service'#9
            Value = 'PUL'
          end
          item
            Description = 'Surgical Service'
            Value = 'SUR'
          end
          item
            Description = 'Urology Service'
            Value = 'URO'
          end>
        TabOrder = 3
        Width = 266
      end
      object lblDoctorName: TcxLabel
        Left = 4
        Top = 67
        Caption = 'Doctor Name'
      end
      object edtDoctorName: TcxTextEdit
        Left = 126
        Top = 66
        TabOrder = 5
        Width = 266
      end
      object lblDoctorSurname: TcxLabel
        Left = 4
        Top = 91
        Caption = 'Doctor Surname'
      end
      object edtDoctorSurname: TcxTextEdit
        Left = 126
        Top = 90
        TabOrder = 7
        Width = 266
      end
    end
    object cxGroupBox1: TcxGroupBox
      Left = 3
      Top = 431
      Caption = 'Patient Allergy Information'
      TabOrder = 17
      Height = 199
      Width = 400
      object dxBarDockControl1: TdxBarDockControl
        Left = 2
        Top = 18
        Width = 396
        Height = 28
        Align = dalTop
        BarManager = bm
      end
      object cxGrid1: TcxGrid
        Left = 2
        Top = 46
        Width = 396
        Height = 151
        Align = alClient
        TabOrder = 1
        ExplicitLeft = 72
        ExplicitTop = 0
        ExplicitWidth = 250
        ExplicitHeight = 200
        object grdAllergy: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsAllergy
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object grdAllergyID: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'ID'
            Width = 97
          end
          object grdAllergyNAME: TcxGridDBColumn
            Caption = 'Name'
            DataBinding.FieldName = 'NAME'
            PropertiesClassName = 'TcxImageComboBoxProperties'
            Properties.ImmediatePost = True
            Properties.Items = <
              item
                Description = 'Animal Allergy'
                ImageIndex = 0
                Value = 'AA'
              end
              item
                Description = 'Drug allergy'
                Value = 'DA'
              end
              item
                Description = 'Environmental Allergy'#9
                Value = 'EA'
              end
              item
                Description = 'Food allergy'#9
                Value = 'FA'
              end
              item
                Description = 'Pollen Allergy'
                Value = 'LA'
              end
              item
                Description = 'Miscellaneous allergy'#9
                Value = 'MA'
              end
              item
                Description = 'Miscellaneous contraindication'#9
                Value = 'MC'
              end
              item
                Description = 'Plant Allergy'#9
                Value = 'PA'
              end>
            Width = 297
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = grdAllergy
        end
      end
    end
    object btnClear: TcxButton
      Left = 320
      Top = 33
      Width = 102
      Height = 22
      Caption = 'Clear Form'
      TabOrder = 18
      OnClick = btnClearClick
    end
  end
  object btnCreateHL7: TcxButton
    Left = 455
    Top = 9
    Width = 129
    Height = 25
    Caption = 'Create HL7 Message'
    TabOrder = 1
    OnClick = btnCreateHL7Click
  end
  object mHL7: TcxMemo
    Left = 456
    Top = 40
    TabOrder = 2
    Height = 194
    Width = 550
  end
  object btnConvertJSON: TcxButton
    Left = 455
    Top = 240
    Width = 129
    Height = 25
    Caption = 'Convert HL7 to JSON'
    TabOrder = 3
    OnClick = btnConvertJSONClick
  end
  object mJSON: TcxMemo
    Left = 456
    Top = 271
    TabOrder = 4
    Height = 360
    Width = 550
  end
  object bm: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 605
    Top = 559
    DockControlHeights = (
      0
      0
      0
      0)
    object bmBar1: TdxBar
      AllowClose = False
      AllowCustomizing = False
      AllowQuickCustomizing = False
      AllowReset = False
      Caption = 'Allergy'
      CaptionButtons = <>
      DockControl = dxBarDockControl1
      DockedDockControl = dxBarDockControl1
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1048
      FloatTop = 8
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'btnAllergyAdd'
        end
        item
          Visible = True
          ItemName = 'btnAllergySave'
        end
        item
          Visible = True
          ItemName = 'btnAllergyDelete'
        end>
      NotDocking = [dsNone, dsLeft, dsTop, dsRight, dsBottom]
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = True
    end
    object btnAllergyAdd: TdxBarButton
      Caption = 'Add'
      Category = 0
      Hint = 'Add'
      Visible = ivAlways
      OnClick = btnAllergyAddClick
    end
    object btnAllergySave: TdxBarButton
      Caption = 'Save'
      Category = 0
      Hint = 'Save'
      Visible = ivAlways
      OnClick = btnAllergySaveClick
    end
    object btnAllergyDelete: TdxBarButton
      Caption = 'Delete'
      Category = 0
      Hint = 'Delete'
      Visible = ivAlways
      OnClick = btnAllergyDeleteClick
    end
  end
  object memAllergy: TdxMemData
    Indexes = <>
    SortOptions = []
    Left = 488
    Top = 560
    object memAllergyID: TStringField
      FieldName = 'ID'
    end
    object memAllergyNAME: TStringField
      FieldName = 'NAME'
      Size = 5
    end
  end
  object dsAllergy: TDataSource
    DataSet = memAllergy
    Left = 544
    Top = 560
  end
end
