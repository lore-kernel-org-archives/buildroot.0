From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Sep 2014 10:58:41 +0200
Subject: [Buildroot] [PATCH 2/2] package/softether: New package
References: <1411835956-23735-1-git-send-email-bernd.kuhls@t-online.de>
 <1411835956-23735-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <XnsA3B66FAC67104berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd Kuhls <bernd.kuhls@t-online.de> wrote in 
news:1411835956-23735-2-git-send-email-bernd.kuhls at t-online.de:

>  package/softether/softether-0001-debian.patch      | 2381 
++++++++++++++++++++
>  package/softether/softether-0003-iconv.patch       |   27 +

Hi,

please note that due to the fact that the sourcecode of softether contains 
DOS line endings these two patch files also contain them. Due to the use of 
"git send-email" these line endings seem to get lost.

Quoted below are all lines containing DOS line endings, if you know a 
better way to distribute my patch please let me know.

Regards, Bernd

$ grep -IUrn $'\r' package/softether/ | cut -d ":" -f 1-2

package/softether/softether-0001-debian.patch:1554
package/softether/softether-0001-debian.patch:1555
package/softether/softether-0001-debian.patch:1556
package/softether/softether-0001-debian.patch:1558
package/softether/softether-0001-debian.patch:1559
package/softether/softether-0001-debian.patch:1560
package/softether/softether-0001-debian.patch:1565
package/softether/softether-0001-debian.patch:1566
package/softether/softether-0001-debian.patch:1567
package/softether/softether-0001-debian.patch:1568
package/softether/softether-0001-debian.patch:1569
package/softether/softether-0001-debian.patch:1570
package/softether/softether-0001-debian.patch:1571
package/softether/softether-0001-debian.patch:1572
package/softether/softether-0001-debian.patch:1577
package/softether/softether-0001-debian.patch:1578
package/softether/softether-0001-debian.patch:1579
package/softether/softether-0001-debian.patch:1580
package/softether/softether-0001-debian.patch:1581
package/softether/softether-0001-debian.patch:1582
package/softether/softether-0001-debian.patch:1583
package/softether/softether-0001-debian.patch:1584
package/softether/softether-0001-debian.patch:1586
package/softether/softether-0001-debian.patch:1587
package/softether/softether-0001-debian.patch:1588
package/softether/softether-0001-debian.patch:1589
package/softether/softether-0001-debian.patch:1590
package/softether/softether-0001-debian.patch:1591
package/softether/softether-0001-debian.patch:1592
package/softether/softether-0001-debian.patch:1593
package/softether/softether-0001-debian.patch:1594
package/softether/softether-0001-debian.patch:1595
package/softether/softether-0001-debian.patch:1596
package/softether/softether-0001-debian.patch:1601
package/softether/softether-0001-debian.patch:1602
package/softether/softether-0001-debian.patch:1603
package/softether/softether-0001-debian.patch:1604
package/softether/softether-0001-debian.patch:1605
package/softether/softether-0001-debian.patch:1606
package/softether/softether-0001-debian.patch:1607
package/softether/softether-0001-debian.patch:1608
package/softether/softether-0001-debian.patch:1699
package/softether/softether-0001-debian.patch:1700
package/softether/softether-0001-debian.patch:1701
package/softether/softether-0001-debian.patch:1702
package/softether/softether-0001-debian.patch:1703
package/softether/softether-0001-debian.patch:1704
package/softether/softether-0001-debian.patch:1705
package/softether/softether-0001-debian.patch:1706
package/softether/softether-0001-debian.patch:1707
package/softether/softether-0001-debian.patch:1708
package/softether/softether-0001-debian.patch:1709
package/softether/softether-0001-debian.patch:1710
package/softether/softether-0001-debian.patch:1711
package/softether/softether-0001-debian.patch:1713
package/softether/softether-0001-debian.patch:1714
package/softether/softether-0001-debian.patch:1715
package/softether/softether-0001-debian.patch:1716
package/softether/softether-0001-debian.patch:1717
package/softether/softether-0001-debian.patch:1718
package/softether/softether-0001-debian.patch:1719
package/softether/softether-0001-debian.patch:1720
package/softether/softether-0001-debian.patch:1722
package/softether/softether-0001-debian.patch:1723
package/softether/softether-0001-debian.patch:1724
package/softether/softether-0001-debian.patch:1725
package/softether/softether-0001-debian.patch:1726
package/softether/softether-0001-debian.patch:1727
package/softether/softether-0001-debian.patch:1728
package/softether/softether-0001-debian.patch:1729
package/softether/softether-0001-debian.patch:1730
package/softether/softether-0001-debian.patch:1731
package/softether/softether-0001-debian.patch:1732
package/softether/softether-0001-debian.patch:1737
package/softether/softether-0001-debian.patch:1738
package/softether/softether-0001-debian.patch:1739
package/softether/softether-0001-debian.patch:1740
package/softether/softether-0001-debian.patch:1741
package/softether/softether-0001-debian.patch:1742
package/softether/softether-0001-debian.patch:1743
package/softether/softether-0001-debian.patch:1744
package/softether/softether-0001-debian.patch:1746
package/softether/softether-0001-debian.patch:1747
package/softether/softether-0001-debian.patch:1748
package/softether/softether-0001-debian.patch:1749
package/softether/softether-0001-debian.patch:1750
package/softether/softether-0001-debian.patch:1751
package/softether/softether-0001-debian.patch:1752
package/softether/softether-0001-debian.patch:1753
package/softether/softether-0001-debian.patch:1865
package/softether/softether-0001-debian.patch:1866
package/softether/softether-0001-debian.patch:1867
package/softether/softether-0001-debian.patch:1868
package/softether/softether-0001-debian.patch:1869
package/softether/softether-0001-debian.patch:1870
package/softether/softether-0001-debian.patch:1871
package/softether/softether-0001-debian.patch:1872
package/softether/softether-0001-debian.patch:1877
package/softether/softether-0001-debian.patch:1878
package/softether/softether-0001-debian.patch:1879
package/softether/softether-0001-debian.patch:1880
package/softether/softether-0001-debian.patch:1881
package/softether/softether-0001-debian.patch:1882
package/softether/softether-0001-debian.patch:1883
package/softether/softether-0001-debian.patch:1884
package/softether/softether-0001-debian.patch:1885
package/softether/softether-0001-debian.patch:1886
package/softether/softether-0001-debian.patch:1887
package/softether/softether-0001-debian.patch:1888
package/softether/softether-0001-debian.patch:1889
package/softether/softether-0001-debian.patch:1890
package/softether/softether-0001-debian.patch:1892
package/softether/softether-0001-debian.patch:1893
package/softether/softether-0001-debian.patch:1894
package/softether/softether-0001-debian.patch:1895
package/softether/softether-0001-debian.patch:1896
package/softether/softether-0001-debian.patch:1897
package/softether/softether-0001-debian.patch:1898
package/softether/softether-0001-debian.patch:1899
package/softether/softether-0001-debian.patch:1901
package/softether/softether-0001-debian.patch:1902
package/softether/softether-0001-debian.patch:1903
package/softether/softether-0001-debian.patch:1904
package/softether/softether-0001-debian.patch:1905
package/softether/softether-0001-debian.patch:1906
package/softether/softether-0001-debian.patch:1907
package/softether/softether-0001-debian.patch:1908
package/softether/softether-0001-debian.patch:1910
package/softether/softether-0001-debian.patch:1911
package/softether/softether-0001-debian.patch:1912
package/softether/softether-0001-debian.patch:1913
package/softether/softether-0001-debian.patch:1914
package/softether/softether-0001-debian.patch:1915
package/softether/softether-0001-debian.patch:1916
package/softether/softether-0001-debian.patch:1917
package/softether/softether-0001-debian.patch:1918
package/softether/softether-0001-debian.patch:1919
package/softether/softether-0001-debian.patch:1920
package/softether/softether-0001-debian.patch:1921
package/softether/softether-0001-debian.patch:1922
package/softether/softether-0001-debian.patch:1923
package/softether/softether-0001-debian.patch:1924
package/softether/softether-0001-debian.patch:1925
package/softether/softether-0001-debian.patch:1926
package/softether/softether-0001-debian.patch:1927
package/softether/softether-0001-debian.patch:1928
package/softether/softether-0001-debian.patch:1929
package/softether/softether-0001-debian.patch:1930
package/softether/softether-0001-debian.patch:1931
package/softether/softether-0001-debian.patch:1932
package/softether/softether-0001-debian.patch:1933
package/softether/softether-0001-debian.patch:1934
package/softether/softether-0001-debian.patch:1935
package/softether/softether-0001-debian.patch:1936
package/softether/softether-0001-debian.patch:1937
package/softether/softether-0001-debian.patch:1938
package/softether/softether-0001-debian.patch:1939
package/softether/softether-0001-debian.patch:1940
package/softether/softether-0001-debian.patch:1941
package/softether/softether-0001-debian.patch:1942
package/softether/softether-0001-debian.patch:1944
package/softether/softether-0001-debian.patch:1945
package/softether/softether-0001-debian.patch:1946
package/softether/softether-0001-debian.patch:1947
package/softether/softether-0001-debian.patch:1948
package/softether/softether-0001-debian.patch:1949
package/softether/softether-0001-debian.patch:1950
package/softether/softether-0001-debian.patch:1951
package/softether/softether-0001-debian.patch:1956
package/softether/softether-0001-debian.patch:1957
package/softether/softether-0001-debian.patch:1958
package/softether/softether-0001-debian.patch:1959
package/softether/softether-0001-debian.patch:1960
package/softether/softether-0001-debian.patch:1961
package/softether/softether-0001-debian.patch:1962
package/softether/softether-0001-debian.patch:1963
package/softether/softether-0001-debian.patch:2015
package/softether/softether-0001-debian.patch:2016
package/softether/softether-0001-debian.patch:2017
package/softether/softether-0001-debian.patch:2018
package/softether/softether-0001-debian.patch:2019
package/softether/softether-0001-debian.patch:2020
package/softether/softether-0001-debian.patch:2021
package/softether/softether-0001-debian.patch:2022
package/softether/softether-0001-debian.patch:2023
package/softether/softether-0001-debian.patch:2024
package/softether/softether-0001-debian.patch:2025
package/softether/softether-0001-debian.patch:2030
package/softether/softether-0001-debian.patch:2031
package/softether/softether-0001-debian.patch:2032
package/softether/softether-0001-debian.patch:2033
package/softether/softether-0001-debian.patch:2034
package/softether/softether-0001-debian.patch:2035
package/softether/softether-0001-debian.patch:2036
package/softether/softether-0001-debian.patch:2037
package/softether/softether-0001-debian.patch:2039
package/softether/softether-0001-debian.patch:2040
package/softether/softether-0001-debian.patch:2041
package/softether/softether-0001-debian.patch:2042
package/softether/softether-0001-debian.patch:2043
package/softether/softether-0001-debian.patch:2044
package/softether/softether-0001-debian.patch:2045
package/softether/softether-0001-debian.patch:2046
package/softether/softether-0001-debian.patch:2047
package/softether/softether-0001-debian.patch:2048
package/softether/softether-0001-debian.patch:2049
package/softether/softether-0001-debian.patch:2054
package/softether/softether-0001-debian.patch:2055
package/softether/softether-0001-debian.patch:2056
package/softether/softether-0001-debian.patch:2057
package/softether/softether-0001-debian.patch:2058
package/softether/softether-0001-debian.patch:2059
package/softether/softether-0001-debian.patch:2060
package/softether/softether-0001-debian.patch:2061
package/softether/softether-0001-debian.patch:2063
package/softether/softether-0001-debian.patch:2064
package/softether/softether-0001-debian.patch:2065
package/softether/softether-0001-debian.patch:2066
package/softether/softether-0001-debian.patch:2067
package/softether/softether-0001-debian.patch:2068
package/softether/softether-0001-debian.patch:2069
package/softether/softether-0001-debian.patch:2070
package/softether/softether-0001-debian.patch:2071
package/softether/softether-0001-debian.patch:2072
package/softether/softether-0001-debian.patch:2073
package/softether/softether-0001-debian.patch:2078
package/softether/softether-0001-debian.patch:2079
package/softether/softether-0001-debian.patch:2080
package/softether/softether-0001-debian.patch:2081
package/softether/softether-0001-debian.patch:2082
package/softether/softether-0001-debian.patch:2083
package/softether/softether-0001-debian.patch:2084
package/softether/softether-0001-debian.patch:2085
package/softether/softether-0001-debian.patch:2087
package/softether/softether-0001-debian.patch:2088
package/softether/softether-0001-debian.patch:2089
package/softether/softether-0001-debian.patch:2090
package/softether/softether-0001-debian.patch:2091
package/softether/softether-0001-debian.patch:2092
package/softether/softether-0001-debian.patch:2093
package/softether/softether-0001-debian.patch:2094
package/softether/softether-0001-debian.patch:2096
package/softether/softether-0001-debian.patch:2097
package/softether/softether-0001-debian.patch:2098
package/softether/softether-0001-debian.patch:2099
package/softether/softether-0001-debian.patch:2100
package/softether/softether-0001-debian.patch:2101
package/softether/softether-0001-debian.patch:2102
package/softether/softether-0001-debian.patch:2103
package/softether/softether-0003-iconv.patch:10
package/softether/softether-0003-iconv.patch:11
package/softether/softether-0003-iconv.patch:12
package/softether/softether-0003-iconv.patch:13
package/softether/softether-0003-iconv.patch:14
package/softether/softether-0003-iconv.patch:15
package/softether/softether-0003-iconv.patch:16
package/softether/softether-0003-iconv.patch:17
package/softether/softether-0003-iconv.patch:18
package/softether/softether-0003-iconv.patch:19
package/softether/softether-0003-iconv.patch:20
package/softether/softether-0003-iconv.patch:21
package/softether/softether-0003-iconv.patch:22
package/softether/softether-0003-iconv.patch:23
package/softether/softether-0003-iconv.patch:25
package/softether/softether-0003-iconv.patch:26
package/softether/softether-0003-iconv.patch:27
