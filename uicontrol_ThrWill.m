function uicontrol_ThrWill

f = figure;
p = uipanel(f,'Position',[0.125 0.75 0.75 0.2]);
    
    function addTextBox(pos, title, unit)
        titleText = uicontrol(p, 'Style', 'text', 'String', title, 'FontWeight', 'bold');
        titlewidth = titleText.Extent(3);
        titleText.Position = [pos 40 titlewidth 20];
        
        unitText = uicontrol(p, 'Style', 'text', 'String', unit);
        unitWidth = unitText.Extent(3);
        unitText.Position = [pos+62 15 unitWidth 20];
        
        uicontrol(p, 'Style', 'edit',...
                     'Position', [pos 20 60 20],...
                     'Callback', @setWavelength);
                 
    % legg til tekstfelt
    addTextBox(20, 'Wavelength', 'nm')
    addTextBox(120, 'OPO power', 'mW')
    addTextBox(220, 'IR power', 'mW')
    addTextBox(320, 'Delay', 'fs')
        
    end

    % test for å lage plottevindu
    axes('Position', [0.1,0.1,0.8,0.6])
    x = linspace(0,1);
    plot(x, sin(2*pi*x))

    
    % skal bestemme hva som skjer når brukeren har lagt inn input 
    function setWavelength(hObj, event) %#ok<INUSL>
        
    thr = get(hObj);
    a = char(thr.String);
    b = str2double(a);
    % hvis b er utenfor gyldig intervall
        % warndig('Feil input!')
    % else
        % sett verdi for laser (send data)  
    %end
    
    end

end