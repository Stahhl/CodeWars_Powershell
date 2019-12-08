function accum($s)
{
    return ($s.ToCharArray() | ForEach-Object {$count = 1} {$_.ToString() * $count++}) -Join '-'
}

function testing($s, $expect) 
{
    $ans = accum $s
    $ans | Should -Be $expect
}

function fixed()
{
    testing "ZpglnRxqenU" "Z-Pp-Ggg-Llll-Nnnnn-Rrrrrr-Xxxxxxx-Qqqqqqqq-Eeeeeeeee-Nnnnnnnnnn-Uuuuuuuuuuu"
    testing "NyffsGeyylB" "N-Yy-Fff-Ffff-Sssss-Gggggg-Eeeeeee-Yyyyyyyy-Yyyyyyyyy-Llllllllll-Bbbbbbbbbbb"
    testing "MjtkuBovqrU" "M-Jj-Ttt-Kkkk-Uuuuu-Bbbbbb-Ooooooo-Vvvvvvvv-Qqqqqqqqq-Rrrrrrrrrr-Uuuuuuuuuuu"
    
}

Describe "accum" {
  Context "Fixed Tests" {
    It "Should Pass Fixed Tests" {
      fixed
    } 
  }
}