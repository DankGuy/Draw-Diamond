program DrawDiamond;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function draw_diamond_star(n : integer) : string;
  var space : integer;
  begin
    space := n - 1;

    // upper half
    for var i := 1 to n do
      begin
        // print the empty spaces
        for var j := 1 to space do
            Write(' ');

        // print the star
        for var k := 1 to 2 * (n-space) - 1 do
            Write('*');

        // next line
        WriteLn('');

        space := space - 1;
      end;

    // lower half
    for var l := 1 to n do
      begin
      space := space + 1;

      // skip the same row as the last output of upper half
      if space = 0 then Continue;

      // print the empty spaces
        for var m := 1 to space do
            Write(' ');

        // print the star
        for var o := 1 to 2 * (n-space) - 1 do
          Write('*');

        // next line
        WriteLn('');
      end;
  end;

function draw_diamond_numbers(n : integer) : string;
  var space : integer;
  begin
    space := n - 1;

    // upper
    var count := 0;
    for var i := 1 to n do
      begin
        count := count + 1;
        // print empty spaces
        for var j := n-count downto 1 do
          Write(' ');

        // print numbers
        for var k := 1 to count do
          Write(k);
        for var l := count - 1 downto 1 do
          Write(l);

        WriteLn('');
      end;

    // lower half
    for var m := n-1 downto 1 do
      begin
        count := count - 1;
        for var a := 1 to n-count do
          Write(' ');

        for var b := 1 to count do
          Write(b);

        for var c := count - 1 downto 1 do
          Write(c);

        WriteLn('');
      end;
  end;

function draw_diamond_alpha(n : integer) : string;
  var space : integer;
  begin
    space := n - 1;

    // upper
    var count := 0;
    for var i := 1 to n do
      begin
        count := count + 1;
        // print empty spaces
        for var j := n-count downto 1 do
          Write(' ');

        // print alphabet
        for var k := 1 to count do
          Write(Chr(k + 64));
        for var l := count - 1 downto 1 do
          Write(Chr(l + 64));

        WriteLn('');
      end;

    // lower half
    for var m := n-1 downto 1 do
      begin
        count := count - 1;
        for var a := 1 to n-count do
          Write(' ');

        for var b := 1 to count do
          Write(Chr(b + 64));

        for var c := count - 1 downto 1 do
          Write(Chr(c + 64));

        WriteLn('');
      end;
  end;

function draw_diamond_unfilled_star(n : integer) : string;
  begin
    var space := n - 1;

    for var i := 1 to n do
      begin
        // print space
        for var j := i to space do
          Write(' ');

        // upper half
        for var k := 1 to (2 * i) - 1 do
          begin
            var last := (2 * i) - 1;
            if (k = 1) or (k = last) then
              Write('*')
            else Write(' ');
          end;
        WriteLn('');
      end;
    // lower half
    var count := 0;
    for var m := n-1 downto 1 do
      begin
        count := count + 1;
        for var j := m to space do
          Write(' ');
        for var k := 1 to (2 * m) - 1 do
          begin
            var last := (2 * m) - 1;
            if (k = 1) or (k = last) then
              Write('*')
            else Write(' ');
          end;
        WriteLn('');
      end;

  end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    var input : integer;
    Repeat
      begin
        Write('Please enter the size of the diamond shape (Enter -1 to stop): ');
        ReadLn(input);
        WriteLn('');
        draw_diamond_star(input);
        draw_diamond_numbers(input);
        draw_diamond_alpha(input);
        draw_diamond_unfilled_star(input);
      end;
    Until input = -1;

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
