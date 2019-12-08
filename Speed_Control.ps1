#https://www.codewars.com/kata/speed-control/powershell

function get-gps($s, $x) {
  $maxAvgSpeed = 0
  for ($i = 1; $i -lt $x.count; $i++) {
    $avgSpeed = (3600 * ($x[$i] - $x[$i - 1]) / $s)
    if ($avgSpeed -gt $maxAvgSpeed) {
      $maxAvgSpeed = $avgSpeed
    }
  }
  return [math]::floor($maxAvgSpeed)
}

function testing($s, $x, $expect) {
  $merr = 1
  $ans = get-gps $s $x
  $e = [math]::abs($ans - $expect)
  $inrange = ($e -le $merr)
  $inrange | Should -Be True
}
function fixed() {
  $x = 0.0, 0.23, 0.46, 0.69, 0.92, 1.15, 1.38, 1.61
  $s = 20
  $u = 41
  testing $s $x $u
  $x = 0.0, 0.11, 0.22, 0.33, 0.44, 0.65, 1.08, 1.26, 1.68, 1.89, 2.1, 2.31, 2.52, 3.25
  $s = 12
  $u = 219
  testing $s $x $u
  $x = 0.0, 0.18, 0.36, 0.54, 0.72, 1.05, 1.26, 1.47, 1.92, 2.16, 2.4, 2.64, 2.88, 3.12, 3.36, 3.6, 3.84
  $s = 20
  $u = 80
  testing $s $x $u
    
}

Describe "get-gps" {
  Context "Fixed Tests" {
    It "Should Pass Fixed Tests" {
      fixed
    } 
  }
}