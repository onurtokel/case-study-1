unit Frm_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, PanatesBlue, Vcl.Menus, cxTextEdit, cxMemo, Vcl.StdCtrls,
  cxButtons, cxGroupBox, cxLabel, Vcl.ComCtrls, dxCore, cxDateUtils, cxMaskEdit, cxDropDownEdit, cxCalendar, cxImageComboBox, dxSkinsdxBarPainter, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxBar,
  dxmdaset, System.StrUtils, system.JSON, ShFolder, System.IOUtils, superobject;

type
  TFrmMain = class(TForm)
    gbForm: TcxGroupBox;
    btnCreateHL7: TcxButton;
    mHL7: TcxMemo;
    btnConvertJSON: TcxButton;
    mJSON: TcxMemo;
    lblName: TcxLabel;
    edtName: TcxTextEdit;
    lblSurname: TcxLabel;
    edtSurname: TcxTextEdit;
    lblMothersMaidenName: TcxLabel;
    edtMothersMaidenName: TcxTextEdit;
    lblBirthDate: TcxLabel;
    dtBirthDate: TcxDateEdit;
    btnFillDummyText: TcxButton;
    lblSex: TcxLabel;
    cmbSex: TcxImageComboBox;
    cxLabel1: TcxLabel;
    cmbRace: TcxImageComboBox;
    gbAddressInformation: TcxGroupBox;
    cxLabel2: TcxLabel;
    edtPhone: TcxMaskEdit;
    lblStreet: TcxLabel;
    edtStreet: TcxTextEdit;
    lblCity: TcxLabel;
    edtCity: TcxTextEdit;
    lblPostCode: TcxLabel;
    edtPostCode: TcxTextEdit;
    lblCountry: TcxLabel;
    lblParishCode: TcxLabel;
    edtParishCode: TcxTextEdit;
    gbPatientVisit: TcxGroupBox;
    lblPatientClass: TcxLabel;
    cmbPatientClass: TcxImageComboBox;
    lblHospitalService: TcxLabel;
    cmbHospitalService: TcxImageComboBox;
    lblDoctorName: TcxLabel;
    edtDoctorName: TcxTextEdit;
    lblDoctorSurname: TcxLabel;
    edtDoctorSurname: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    dxBarDockControl1: TdxBarDockControl;
    bm: TdxBarManager;
    bmBar1: TdxBar;
    btnAllergyAdd: TdxBarButton;
    btnAllergySave: TdxBarButton;
    btnAllergyDelete: TdxBarButton;
    grdAllergy: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    grdAllergyID: TcxGridDBColumn;
    grdAllergyNAME: TcxGridDBColumn;
    memAllergy: TdxMemData;
    dsAllergy: TDataSource;
    memAllergyID: TStringField;
    memAllergyNAME: TStringField;
    btnClear: TcxButton;
    cmbCountry: TcxImageComboBox;
    procedure btnCreateHL7Click(Sender: TObject);
    procedure btnFillDummyTextClick(Sender: TObject);
    procedure btnAllergyAddClick(Sender: TObject);
    procedure btnAllergySaveClick(Sender: TObject);
    procedure btnAllergyDeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnConvertJSONClick(Sender: TObject);
  private
    HL7Json : ISuperObject;
    procedure CreateHL7Message;
    procedure ConvertHL7toJSON;
    function SubString(Str, Delimiter: String; Index: Integer): String;
    procedure GetHL7LibraryFile;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

const
  Seperator1 = '^'; //component separator
  Seperator2 = '~'; //repetition separator
  Seperator3 = '\'; //escape character
  Seperator4 = '&'; //subcomponent separator
  Seperator = Seperator1 + Seperator2 + Seperator3 + Seperator4;


procedure TFrmMain.btnAllergyAddClick(Sender: TObject);
begin
  memAllergy.Append;
  memAllergy.FieldByName('ID').AsInteger := memAllergy.RecNo;
end;

procedure TFrmMain.btnAllergyDeleteClick(Sender: TObject);
begin
  if memAllergy.IsEmpty then exit;
  memAllergy.Delete;
end;

procedure TFrmMain.btnAllergySaveClick(Sender: TObject);
begin
  if memAllergy.State in [dsInsert,dsEdit] then
    memAllergy.Post;
end;

procedure TFrmMain.btnClearClick(Sender: TObject);
begin
  edtName.Text := '';
  edtSurname.Text := '';
  edtMothersMaidenName.Text := '';
  dtBirthDate.Date := 0;
  cmbSex.EditValue := null;
  cmbRace.EditValue := null;
  edtPhone.EditValue := '';
  edtStreet.Text := '';
  edtCity.Text := '';
  edtPostCode.Text := '';
  cmbCountry.EditValue := null;
  edtParishCode.Text := '';
  cmbPatientClass.EditValue := null;
  cmbHospitalService.EditValue := null;
  edtDoctorName.Text := '';
  edtDoctorSurname.Text := '';
  memAllergy.Close;
  memAllergy.Open;
end;

procedure TFrmMain.btnConvertJSONClick(Sender: TObject);
begin
  ConvertHL7toJSON;
end;

procedure TFrmMain.btnCreateHL7Click(Sender: TObject);
begin
  CreateHL7Message;
end;

procedure TFrmMain.btnFillDummyTextClick(Sender: TObject);
begin
  edtName.Text := 'TESTNAME';
  edtSurname.Text := 'TESTSURNAME';
  edtMothersMaidenName.Text := 'TESTMOTHERSMAIDENNAME';
  dtBirthDate.Date := StrToDate('05.10.1990');
  cmbSex.EditValue := 'M';
  cmbRace.EditValue := '2106-3';
  edtPhone.EditValue := '5555555555';
  edtStreet.Text := 'CAGDAS';
  edtCity.Text := 'IZMIR';
  edtPostCode.Text := '35160';
  cmbCountry.EditValue := '90';
  edtParishCode.Text := 'BUCA';
  cmbPatientClass.EditValue := 'O';
  cmbHospitalService.EditValue := 'MED';
  edtDoctorName.Text := 'TESTDOCTORNAME';
  edtDoctorSurname.Text := 'TESTDOCTORSURNAME';
  memAllergy.Close;
  memAllergy.Open;
  memAllergy.Append;
  memAllergy.FieldByName('ID').AsString := '1';
  memAllergy.FieldByName('NAME').AsString := 'AA';
  memAllergy.Post;
  memAllergy.Append;
  memAllergy.FieldByName('ID').AsString := '2';
  memAllergy.FieldByName('NAME').AsString := 'FA';
  memAllergy.Post;
end;

procedure TFrmMain.CreateHL7Message;
  procedure AddSegment(s:String);
  begin
    mHL7.Lines.Add(s);
  end;
  function PID_Create:String;
  begin
    Result := 'PID|1||PATID001^5^M11^ADT4^MR||' + Trim(edtSurname.Text) + '^' + Trim(edtName.Text) + '|' + Trim(edtMothersMaidenName.Text) + '|' +
           ifthen(dtBirthDate.Date>0,FormatDateTime('YYYYMMDD',dtBirthDate.Date)) + '|' + VarToStr(cmbSex.EditValue) + '||' + VarToStr(cmbRace.EditValue) + '|'+
           Trim(edtStreet.Text) + '^^' + Trim(edtCity.Text) + '^^' + Trim(edtPostCode.Text) + '^' +
           VarToStr(cmbCountry.EditValue) + '^^^' + Trim(edtParishCode.Text) + '||' + edtPhone.Text;
  end;
  function PV1_Create:String;
  begin
    Result := 'PV1|1|' + VarToStr(cmbPatientClass.EditValue) + '|||||DID14562^'+edtDoctorSurname.Text+'^'+edtDoctorName.Text + '|||' + VarToStr(cmbHospitalService.EditValue);
  end;
  function AL1_Create(Id,Name:string):String;
  begin
    Result := 'AL1|' + Id + '|' + Name + '|' + Name;
  end;
  var MSH, EVN : String;
begin
  mHL7.Clear;
  //Add MSH
  MSH := 'MSH|' + Seperator + '|ADT4|TRIAL HOSPITAL|PATIENTADT|TRIAL HOSPITAL|198808181126|SECURITY|ADT^A04|MSG00001|P|2.7';
  AddSegment(MSH);
  //Add EVN
  EVN := 'EVN|A04|'+FormatDateTime('YYYYMMDDHHNN', now);
  AddSegment(EVN);
  //Add PID
  AddSegment(PID_Create);
  //Add PV1
  AddSegment(PV1_Create);
  //Add AL1
  memAllergy.First;
  while not memAllergy.Eof do
  begin
    AddSegment(AL1_Create(memAllergy.FieldByName('ID').AsString,memAllergy.FieldByName('NAME').AsString));
    memAllergy.Next;
  end;
end;

procedure TFrmMain.ConvertHL7toJSON;
var SegmentList: TStringList;
    SegmentName, SegmentContent : String;
    i : Integer;
    Node, Node2, Node3, NewJson : ISuperObject;
    NodeCode,NodeName, Node2Order, Node2Name, Node3Order, Node3Name, Node2Value, Node3Value : String;
begin
  mJSON.Clear;
  SegmentList := TStringList.Create;
  ExtractStrings([#13], [], PChar(mHL7.Text), SegmentList);
  NewJson := TSuperObject.Create(stArray);
  try
    try
      for i := 0 to SegmentList.Count -1 do   //returning generated hl7 message
      begin
        SegmentName := SubString(SegmentList[i],'|',1);
        SegmentContent := SegmentList[i];
        for Node in HL7Json['HL7_Json'] do   //returning hl7 library
        begin
          NodeCode := Node.S['Code'];
          NodeName := Node.S['Name'];
          if NodeCode = SegmentName then
          begin
            NewJson.O[''] := TSuperObject.Create;  // Step 1 (Add Segment)
            NewJson.O[''].S['Code'] := NodeCode;
            NewJson.O[''].S['Name'] := NodeName;
            NewJson.O[''].O['Items']:= TSuperObject.Create(stArray);
            for Node2 in Node['Items'] do
            begin
              Node2Order := Node2.S['Order'];
              Node2Name := Node2.S['Name'];
              if NodeCode = 'MSH' then
                Node2Value := SubString(SegmentContent,'|',StrToInt(Node2Order))
              else
                Node2Value := SubString(SegmentContent,'|',StrToInt(Node2Order)+1);
              if (NodeCode = 'MSH') and (Node2Name = 'FieldSeparator') then
                Node2Value := '|';
              if Node2Value <> '' then
              begin
                NewJson.O[''].O['Items'].O[''] := TSuperObject.Create; //Step 2 (Add Field)
                NewJson.O[''].O['Items'].O[''].S['Order'] := Node2Order;
                NewJson.O[''].O['Items'].O[''].S['Name'] := Node2Name;
                if not Assigned(Node2.A['Items']) then
                  NewJson.O[''].O['Items'].O[''].S['Value'] := Node2Value;
              end;
              if Assigned(Node2.A['Items']) then //Step 3 (Add Subfield)
              begin
                NewJson.O[''].O['Items'].O[''].O['Items']:= TSuperObject.Create(stArray);
                for Node3 in Node2['Items'] do
                begin
                  Node3Order := Node3.S['Order'];
                  Node3Name :=  Node3.S['Name'];
                  Node3Value := SubString(Node2Value,Seperator1,StrToInt(Node3Order));
                  if Node3Value <> '' then
                  begin
                    NewJson.O[''].O['Items'].O[''].O['Items'].O[''] := TSuperObject.Create;
                    NewJson.O[''].O['Items'].O[''].O['Items'].O[''].S['Order'] := Node3Order;
                    NewJson.O[''].O['Items'].O[''].O['Items'].O[''].S['Name'] := Node3Name;
                    NewJson.O[''].O['Items'].O[''].O['Items'].O[''].S['Value'] := Node3Value;
                  end;
                end;
              end;
            end;
          end;
        end;
      end;
    except
      on e : Exception do raise Exception.Create(e.Message);
    end;
  finally
    SegmentList.Free;
  end;
  mJSON.Lines.Add(NewJson.AsJSon());
end;

function TFrmMain.SubString(Str:String; Delimiter:String; Index:Integer): String;
var
  I,K, dlen, Idx : Integer;
label Return;
begin
  Result := '';
  dlen := Length(Delimiter);
  Idx := 1;
  K := 1;
  I := 1;
  while Idx <= Index do begin
    K := PosEx(Delimiter, Str, K);
    if (K = 0) then begin
      if (Idx = Index) then
        Result := Copy(Str, I, MaxInt-1);
      Exit;
    end;
    if (Idx = Index) then begin
      Result := Copy(Str, I, K-I);
      Exit;
    end;
    Inc(Idx);
    K := K + dlen;
    I := K;
  end;
end;

procedure TFrmMain.GetHL7LibraryFile;
var FileName : String;
begin
  FileName := ExtractFileDir(application.ExeName) + '\hl7_v27x.json';
  HL7Json := TSuperObject.ParseFile(FileName,True);
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  memAllergy.Open;
  GetHL7LibraryFile;
end;

end.
