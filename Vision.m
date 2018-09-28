function varargout = Vision(varargin)
% VISION MATLAB code for Vision.fig
%      VISION, by itself, creates a new VISION or raises the existing
%      singleton*.
%
%      H = VISION returns the handle to a new VISION or the handle to
%      the existing singleton*.
%
%      VISION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISION.M with the given input arguments.
%
%      VISION('Property','Value',...) creates a new VISION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Vision_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Vision_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Vision

% Last Modified by GUIDE v2.5 20-Mar-2014 14:50:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Vision_OpeningFcn, ...
                   'gui_OutputFcn',  @Vision_OutputFcn, ...
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


% --- Executes just before Vision is made visible.
function Vision_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Vision (see VARARGIN)

% Choose default command line output for Vision
handles.output = hObject;

% Update handles structur
handles.banderita=0;
handles.band1=0;
handles.band2=0;
guidata(hObject, handles);

% UIWAIT makes Vision wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Vision_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function nameimage_Callback(hObject, eventdata, handles)
% hObject    handle to nameimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nameimage as text
%        str2double(get(hObject,'String')) returns contents of nameimage as a double
handles.name=get(hObject,'String');
handles.banderita=1;

handles.J=imread(handles.name); 
guidata(hObject, handles);



% --- Executes during object creation, after setting all properties.
function nameimage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nameimage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if handles.banderita==0
    handles.J=imread('pugño.jpg'); 
end
imshow(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Expancion.
function Expancion_Callback(hObject, eventdata, handles)
% hObject    handle to Expancion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.band1==0
    handles.a0=150; 
end
if handles.band2==0
    handles.a1=220; 
end
Expancion(handles.J,handles.a0,handles.a1);
guidata(hObject, handles);


% --- Executes on button press in Igualacion.
function Igualacion_Callback(hObject, eventdata, handles)
% hObject    handle to Igualacion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Igualacion(handles.J);
guidata(hObject, handles);


% --- Executes on button press in Histograma.
function Ruido_Gaussiano_Callback(hObject, eventdata, handles)
% hObject    handle to Histograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ruido_gaussiano(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Histograma.
function Histograma_Callback(hObject, eventdata, handles)
% hObject    handle to Histograma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Histograma(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Histograma_Acum.
function Histograma_Acum_Callback(hObject, eventdata, handles)
% hObject    handle to Histograma_Acum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Histograma_Acum(handles.J)
guidata(hObject, handles);



function a0_Callback(hObject, eventdata, handles)
% hObject    handle to a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a0 as text
%        str2double(get(hObject,'String')) returns contents of a0 as a double
handles.a0=str2double(get(hObject,'String'));
handles.band1=1;

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function a0_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a0 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function a1_Callback(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of a1 as text
%        str2double(get(hObject,'String')) returns contents of a1 as a double
handles.a0=str2double(get(hObject,'String'));
handles.band2=1;

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function a1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Ruido_saltpepper.
function Ruido_saltpepper_Callback(hObject, eventdata, handles)
% hObject    handle to Ruido_saltpepper (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Ruido_saltpepper(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Filtro_Gaussiano.
function Filtro_Gaussiano_Callback(hObject, eventdata, handles)
% hObject    handle to Filtro_Gaussiano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Filtro_Gaussiano(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Filtro_Promedio.
function Filtro_Promedio_Callback(hObject, eventdata, handles)
% hObject    handle to Filtro_Promedio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Filtro_Promedio(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Filtro_Mediana.
function Filtro_Mediana_Callback(hObject, eventdata, handles)
% hObject    handle to Filtro_Mediana (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Filtro_Mediana(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Filtro_Derivativo.
function Filtro_Derivativo_Callback(hObject, eventdata, handles)
% hObject    handle to Filtro_Derivativo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Filtro_Derivativo(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Sobel.
function Sobel_Callback(hObject, eventdata, handles)
% hObject    handle to Sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Sobel(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Laplaciano.
function Laplaciano_Callback(hObject, eventdata, handles)
% hObject    handle to Laplaciano (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Laplaciano(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Detector_Esquinas.
function Detector_Esquinas_Callback(hObject, eventdata, handles)
% hObject    handle to Detector_Esquinas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Detector_Esquinas(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Harris.
function Harris_Callback(hObject, eventdata, handles)
% hObject    handle to Harris (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Harris(handles.J)
guidata(hObject, handles);


% --- Executes on button press in LoG.
function LoG_Callback(hObject, eventdata, handles)
% hObject    handle to LoG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LoG(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Hough.
function Hough_Callback(hObject, eventdata, handles)
% hObject    handle to Hough (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Hough(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Canny.
function Canny_Callback(hObject, eventdata, handles)
% hObject    handle to Canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Canny(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Escala.
function Escala_Callback(hObject, eventdata, handles)
% hObject    handle to Escala (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Escala(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Prewitt.
function Prewitt_Callback(hObject, eventdata, handles)
% hObject    handle to Prewitt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Prewitt(handles.J)
guidata(hObject, handles);


% --- Executes on button press in Salir.
function Salir_Callback(hObject, eventdata, handles)
% hObject    handle to Salir (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
clear all
close all
clc
guidata(hObject, handles);
