function varargout = EkstrakBentuk(varargin)
% EKSTRAKBENTUK MATLAB code for EkstrakBentuk.fig
%      EKSTRAKBENTUK, by itself, creates a new EKSTRAKBENTUK or raises the existing
%      singleton*.
%
%      H = EKSTRAKBENTUK returns the handle to a new EKSTRAKBENTUK or the handle to
%      the existing singleton*.
%
%      EKSTRAKBENTUK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKSTRAKBENTUK.M with the given input arguments.
%
%      EKSTRAKBENTUK('Property','Value',...) creates a new EKSTRAKBENTUK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EkstrakBentuk_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EkstrakBentuk_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help EkstrakBentuk

% Last Modified by GUIDE v2.5 30-May-2022 16:44:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EkstrakBentuk_OpeningFcn, ...
                   'gui_OutputFcn',  @EkstrakBentuk_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before EkstrakBentuk is made visible.
function EkstrakBentuk_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EkstrakBentuk (see VARARGIN)

% Choose default command line output for EkstrakBentuk
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes EkstrakBentuk wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EkstrakBentuk_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

open=guidata(gcbo);
[namafile]=uigetfile({'*.jpg;*.bmp;*.tif;*.png'},'openimage');
I=imread(namafile);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(I));colormap('gray');
set(open.axes1,'Userdata',I);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open=guidata(gcbo);
I = get(open.axes1,'Userdata');
gray = rgb2gray(I);
level = graythresh(gray);
hasil = im2bw(gray,level);
a = bwarea(hasil);
b = bwperim(hasil);
perimeter = sum(sqrt(sum(b,2)));
set(handles.edit1,'string',(a));
set(handles.edit2,'string',(perimeter));
set(open.figure1,'CurrentAxes',open.axes2);
set(imagesc(hasil));colormap('gray');
set(open.axes2,'Userdata',hasil);



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
