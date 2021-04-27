function uicontrol_ThrWill

f = figure;
p = uipanel(f,'Position',[0.1 0.6 0.6 0.2]);
testf = uicontrol('Style', 'pushbutton', 'String', 'OK',...
            'Fontsize', 14, 'Fontweight', 'b',...
            'Position', [90 10 70 40], 'Callback',...
            {@OK_button_Callback});
    
    setSignalTxt = uicontrol(p, 'Style', 'text',...
                                'String', 'Wavelength',...
                                'Position', [20 40 60 20]);
    setSignalBox = uicontrol(p, 'Style', 'edit',...
                                'Callback', @setmap);
    setOPOpwrTxt = uicontrol(p, 'Style', 'text',...
                                'String', 'OPO power',...
                                'Position', [100 40 60 20]);
    setOPOpwrBox = uicontrol(p, 'Style', 'edit',...
                                'Position', [100 20 60 20],...
                                'Callback', @setmap);
    setIRpwrTxt  = uicontrol(p, 'Style', 'text',...
                                'String', 'IR power',...
                                'Position', [180 40 60 20]);
    setIRpwrBox  = uicontrol(p, 'Style', 'edit',...
                                'Position', [180 20 60 20],...
                                'Callback', @setmap);
    setDelayTxt  = uicontrol(p, 'Style', 'text',...
                                'String', 'Delay',...
                                'Position', [260 40 60 20]);    
    setDelayBox  = uicontrol(p, 'Style', 'edit',...
                                'Position', [260 20 60 20],...
                                'Callback', @setmap);
        
    function setmap(hObj, event) %#ok<INUSL>
        
    thr = get(hObj);
    a = char(thr.String);
    b = str2double(a);
    if b > 1000
        warndig('Feil input!')
        
    end
    
    end

end