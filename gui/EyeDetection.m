
function varargout = EyeDetection(varargin)
% EYEDETECTION MATLAB code for EyeDetection.fig
%      EYEDETECTION, by itself, creates a new EYEDETECTION or raises the existing
%      singleton*.
%
%      H = EYEDETECTION returns the handle to a new EYEDETECTION or the handle to
%      the existing singleton*.
%
%      EYEDETECTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EYEDETECTION.M with the given input arguments.
%
%      EYEDETECTION('Property','Value',...) creates a new EYEDETECTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before EyeDetection_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to EyeDetection_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

%------------------------------------------------------------------------------------
% Most of the GUI code below was created through MATLAB's GUI Editor.
% This is the case unless otherwise stated by additional comments.
% Last edited by Alex Barrington, 2018.05.01
%------------------------------------------------------------------------------------

% Edit the above text to modify the response to help EyeDetection

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @EyeDetection_OpeningFcn, ...
                   'gui_OutputFcn',  @EyeDetection_OutputFcn, ...
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

% --- Executes just before EyeDetection is made visible.
function EyeDetection_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to EyeDetection (see VARARGIN)
% Last edited by Alex Barrington, 2018.05.01

% Choose default command line output for EyeDetection
handles.output = hObject;
hObject.Name = 'EyeDetection';
% Update handles structure
guidata(hObject, handles);
delete(findall(gcf,'type','annotation'))
delete(findall(gcf,'type','image'))
% This sets up the initial plot - only do when we are invisible
% so window can get raised using EyeDetection.
if strcmp(get(hObject,'Visible'),'off')
    plot(rand(5));
end
handles.circle = plot(0, 0, 'r', 'LineWidth', 1);
set(handles.axes1,'visible','off') %hide the current axes
set(get(handles.axes1,'children'),'visible','off') %hide the current axes contents


% UIWAIT makes EyeDetection wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = EyeDetection_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Last edited by Alex Barrington, 2018.05.01

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in openInputFileDialog.
function openInputFileDialog_Callback(hObject, eventdata, handles)
% hObject    handle to openInputFileDialog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Last edited by Alex Barrington, 2018.05.01

[file path] = uigetfile('*.jpeg;*.jpg;*.JPG');
filepath = strcat(path, file);
set(handles.jpeg_file_path, 'String', filepath);


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'plot(rand(5))', 'plot(sin(1:0.01:25))', 'bar(1:.5:10)', 'plot(membrane)', 'surf(peaks)'});



function jpeg_file_path_Callback(hObject, eventdata, handles)
% hObject    handle to jpeg_file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of jpeg_file_path as text
%        str2double(get(hObject,'String')) returns contents of jpeg_file_path as a double


% --- Executes during object creation, after setting all properties.
function jpeg_file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to jpeg_file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in openOutputFileDialog.
function openOutputFileDialog_Callback(hObject, eventdata, handles)
% hObject    handle to openOutputFileDialog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Last edited by Alex Barrington, 2018.05.01

[file path] = uigetfile('*.txt;*.csv;*.TXT');
filepath = strcat(path, file);
set(handles.output_file_path, 'String', filepath);


function output_file_path_Callback(hObject, eventdata, handles)
% hObject    handle to output_file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of output_file_path as text
%        str2double(get(hObject,'String')) returns contents of output_file_path as a double


% --- Executes during object creation, after setting all properties.
function output_file_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to output_file_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in mainButton.
function mainButton_Callback(hObject, eventdata, handles)
% hObject    handle to mainButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Last edited by Alex Barrington, 2018.05.01
imagePath = get(handles.jpeg_file_path, 'String');
outputPath = get(handles.output_file_path, 'String');
delete(findall(gcf,'type','annotation'))
delete(findall(gcf,'type','image'))
cla

if(isfield(handles,'circle'))
    delete(handles.circle)
    disp('Delete circle')
end
if(~validateInput(imagePath, outputPath))
    fprintf('ERROR: enter valid input files (.jpg/.jpeg for image .txt for output)\n')
else
    %load image from path
    inputImage = imread(imagePath);
    hObject.BackgroundColor = 'g';
    drawnow
    %grab size of image
    [rows, cols, rgb] = size(inputImage);
    if(rgb==1)
        imageGray = zeros(rows, cols);
        fileID = fopen('image-gray.bin', 'w+');

        %convert the rgb values to gray, write to image-gray.bin
        for i = 1:rows
            for j = 1:cols
                %weighted RGB to Gray: 0.2989 R + 0.5870 G + 0.1140 B 
                fprintf(fileID, '%u ', inputImage(i,j));
                imageGray(i,j) = inputImage(i,j);
            end
            fprintf(fileID, '\n');
        end
        disp('Input image not in RGB format.');
    elseif(rgb==3)
    imageGray = zeros(rows, cols);
    fileID = fopen('image-gray.bin', 'w+');

    %convert the rgb values to gray, write to image-gray.bin
    for i = 1:rows
        for j = 1:cols
            %weighted RGB to Gray: 0.2989 R + 0.5870 G + 0.1140 B 
            pixel = (0.2989 .* inputImage(i,j,1)) + (0.5870 * inputImage(i,j,2)) +  (0.1140 .* inputImage(i,j,3));
            fprintf(fileID, '%u ', pixel);
            imageGray(i,j) = pixel;
        end
        fprintf(fileID, '\n');
    end
    end
    fclose(fileID);
    imageGray = cast(imageGray, 'uint8');
    
    %plot the image in the figure
    gx = imagesc(imageGray);
    colormap gray;
    set(handles.axes1,'visible','on') %show the current axes
    set(get(handles.axes1,'children'),'visible','on') %show the current axes contents
    handles.axes1.YLim=[1 size(imageGray,1)];
    handles.axes1.XLim=[1 size(imageGray,2)];
    hold on;
    drawnow
	
	% references
	% calling the main program executable: https://www.mathworks.com/matlabcentral/answers/92537-how-do-i-pass-arguments-into-and-out-of-my-standalone-executable-running-exe-file-from-mtlab-using-system
	% Make sure to use Circle.txt (provided in zip folder) as the output file
	% because it contains dummy circle coordinate/radius data for plotting
	
   %------Calling the main program --- Sophia
       
    % the executable must be passed in in a specific manner to run. Create
    % a string that includes the dummy ReturnsZero.exe provided by the main
    % team, and the input arguments. The should already be converted to a
    % string, but in case they are not, the 'num2str' method is used
    
    % This line was used to test an unsuccessful executable run
    % return_value = system('ReturnsZero.exe')
    
    % error-check in case the executable does
    
    commandStr = char(strcat({'EyeDetection\Release\EyeDetection.exe image-gray.bin '}, num2str(cols),{' '},num2str(rows),{' '},({outputPath})))
        
	% use the system command execute the executable
    cd C:\Users\Jim\Documents\GitHub\eye-detection
    return_value = system(commandStr)
    
    if (return_value ~= 0) 
		disp(' The executable did not terminate successfully.')
    end
        
	% extract the x-coordinate of the circle, y-coordinate of the circle
	% and radius of the circle from the text file output by the main
	% program using the comma-separated value Matlab function
	circleData = csvread(outputPath);
       
	% Error check in case the data from the text file cannot be
	% extracted
	if (size(circleData) == 0) 
		disp('The output data is either not in the specified text file, or is not formatted correctly. Each data value should be separated by a comma')  
	end 

	% Store each of the three array elements in an intuitive variable
	% name for further calculations
	y = circleData(1);
	x = circleData(2);
	r = circleData(3);

	% end Sophia's part
	% call the main.exe and if 0 is returned, then overplot the circle from
	% the csv
 
% Old code 
%	if(system('test resources\ReturnsZero.exe')==-1.073741515000000e+09) %paths to test files (should convert to relative)
%       coords = csvread(outputPath);
%       x = coords(1); y = coords(2); r = coords(3);
% Conversion of coordinates to image space and a circle that will be drawn on the image with a textbox.       
       th = 0:pi/50:2*pi;
       xunit = r * cos(th) + x;
       yunit = r * sin(th) + y;
       handles.circle = plot(xunit, yunit, 'r', 'LineWidth', 2);
       disp('Processed image.');
       handles.ann = annotation('textbox', [ .2 .55 .1 .1 ],'Color', 'r','String',strcat('Pupil found at (',num2str(x),',',num2str(y),') with radius=',num2str(r),'.'));
%    else
%        disp('ERROR, missing output file.');
%	end
    
	% Return object color.
	hObject.BackgroundColor = [.94 .94 .94];
	
end

function isValid = validateInput(imagePath, outputPath)
	% Check if the two inputs are valid
	% Last edited by Alex Barrington, 2018.05.01

    isValid = 0;
    
	% Only allow JPGs to be input and TXTs or CSVs to be output.
    imagePattern = '^.*\.(?:jpg|jpeg|JPG)$';
    outputPattern = '^.*\.(?:txt|csv|TXT)$';
    
    if (regexp(imagePath, imagePattern))
       if(regexp(outputPath, outputPattern))
           isValid = 1;
       end
    end

% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
