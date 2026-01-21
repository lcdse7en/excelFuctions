#import "../lib/lib.typ": *

= 数字函数

#figure(
  kind: table,
  caption : "Numeric functions",
    table(
    columns: (0.6fr, 1.8fr, 2fr),
    stroke: (x, y) => if y == 0 {
      (
        // top: (thickness: 1.2pt, paint: black),
        bottom: (thickness: 1.2pt, paint: black),
      )
    } else if y > 0 {
      (
        bottom: (thickness: 0.7pt, paint: black, dash: "dashed"),
      )
    },
    align: (x, y) => (
      if x > 0 { left } else { center }
    ),
    table.header(
      align(center)[
        Function
      ],
      align(center)[
        Example
      ],
      align(center)[
        Explain
      ],
    ),
    [#lower("ABS")], [\=#lower("ABS") (A1) ; \=#lower("ABS") (0)], [得出数字值或持续时间值的绝对值],

    [#lower("CEILING")], [=#lower("CEILING") (0.25, 1) 得出 1，即为大于或等于 0.25 的最近的 1 的倍数。], [函数会将一个数字往与 0 相反的方向四舍五入到最接近的指定因数倍数],

    [#lower("FACT")], [\=#lower("FACT") (5) 得出 120，或 1 * 2 * 3 * 4 * 5], [得出一个数字的阶乘],

    [#lower("INT")], [=#lower("INT") (-2.2) 得出 -3], [得出小于或等于某数的最接近的整数],

    [#lower("MOD")], [\=#lower("MOD") (7, 3) 得出 1，即为 7 除以 3 所得余数], [得出除法的余数],

    [#lower("POWER")], [\=#lower("POWER") (数字, 指数) ; \=POWER(2, 3) 得出 8], [得出一个数乘方所得的幂],

    [#lower("ROUND")], [\=#lower("ROUND") (要舍入的数字, 数字位数)], [得出一个朝指定位数四舍五入的数字],

    [#lower("TRUNC")], 
    [\=#lower("TRUNC") (1.23456, 3) 得出 1.234（第三位小数位之后全部被忽略）],
    [将一个数字截至指定位数],

    [#lower("SUM")], 
    [\=#lower("SUM") (A1:A4, 100)], 
    [得出数字集合之和], 


    [#lower("SUMIF")], 
    [\=#lower("SUMIF") (待检验的值, 条件, 待求和的值) ; \=SUMIF(A1:A5, \“\<5\”) 得出 10，因为 1、2、3 和 4（条件的值小于 5，包含在待检验的值的范围 A1:A5 内）的和是 10 ; \=SUMIF(A1:A5, \“\<5\”, B1:B5) 得出 100，因为 10、20、30 和 40（A 列中小于 5 的值在 B 列（待求和的值 是 B1:B5）中所对应的值）的总和是100], 
    [得出一组数字的总和，且仅包括满足指定条件的数字], 

    [#lower("SUMPRODUCT")],
    [\=#lower("SUMPRODUCT") (B1:E1, B2:E2)],
    [得出两个或多个集合内对应数字的乘积之和],


  ),
)
