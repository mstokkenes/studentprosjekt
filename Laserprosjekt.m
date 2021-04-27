s = serial('COM7');
fopen(s);
s.Status
s.Baudrate = 38400;
s.Databit = 8;
s.Terminator = 'LF';
fprintf(s, '*IDN?');
s.Bytesavailible
idn = fscanf(s);
fprintf(s, 'OPO WAVELENGTH?');
s.BytesAvailible
idn = fscanf(s);

fclose(s);
delete(s);
clear s