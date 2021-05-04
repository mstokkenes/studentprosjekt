function GUI

% define window and panel for text boxes
f = figure;
p = uipanel(f,'Position',[0.125 0.75 0.75 0.2]);
    
    % function for adding text box with given position (relative to panel),
    % descriptive title above and unit to the right
    function addTextBox(pos, title, unit, action)
        
        % adds the text field itself
        uicontrol(p, 'Style', 'edit',...
                     'Position', [pos 20 60 20],...
                     'Callback', action);
        
        % set title above text box
        titleText = uicontrol(p, 'Style', 'text',...
                                 'String', title,... 
                                 'FontWeight', 'bold');
        titlewidth = titleText.Extent(3);
        titleText.Position = [pos 40 titlewidth 20];
        
        % set unit to the right
        unitText = uicontrol(p, 'Style', 'text',...
                                'String', unit);
        unitWidth = unitText.Extent(3);
        unitText.Position = [pos+62 15 unitWidth 20];
                 
        end
  
    % add text fields for wavelength, OPO power, IR power and delay
    addTextBox(20,  'Wavelength', 'nm', 'OPO WAVELENGTH')
    addTextBox(120, 'OPO power',  'mW', 'OPO POWER')
    addTextBox(220, 'IR power',   'mW', 'IR POWER')
    addTextBox(320, 'Delay',      'fs', 'DELAY REL')
        
    % add plot window visualising wavelength
    axes('Position', [0.1,0.1,0.8,0.6])
    x = linspace(0,1);
    plot(x, sin(2*pi*x))
    
    s = serial('COM7');
    fopen(s);
    s.Status
    s.Baudrate = 38400;
    s.Databit = 8;
    s.Terminator = 'LF';
    fprintf(s, '*IDN?');
    s.Bytesavailible
    idn = fscanf(s);
    s.BytesAvailible
    idn = fscanf(s);
    
    % callback funtions 
    function action(hObj, param)
        
        thr = get(hObj);
        a = char(thr.String);
        b = str2double(a);
        
        if param == "Wavelength"
            if 780 <= b <= 990
                fprintf('OPO WAVELENGTH', 10*b);
            else
                warndig('Bølgelengde må være mellom 780 og 990 nm')
            end
            
        else 
            fprintf(param, b);
  
        end
        
    end

    fclose(s);
    delete(s);
    clear s

end