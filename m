From: Anders Blomdell <anders.blomdell@control.lth.se>
Date: Tue, 21 Oct 2008 09:14:50 +0200
Subject: [Buildroot] Backdoors?
Message-ID: <48FD816A.6050101@control.lth.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nowhere in the documentation, I can find the passwords for:

target/device/valka/target_skeleton/etc/shadow:root:$1$3P2nFqtv$yuwcUwEGBusYZtAOvzOrF/:13200:0:99999:7:::
target/device/valka/target_skeleton/etc/shadow:valka:$1$rDBo1uCh$EVSlBaeBgyHiSpZpShyW./:0:0:99999:7:::
target/device/Atmel/atngw100-base/target_skeleton/etc/shadow:root:$1$OJeedGT3$uG0eWkNhkeq0WO6Wldk1Y.:13200:0:99999:7:::
target/device/Atmel/atstk100x/target_skeleton/etc/shadow:root:$1$OJeedGT3$uG0eWkNhkeq0WO6Wldk1Y.:13200:0:99999:7:::
target/device/Atmel/atstk100x/target_skeleton/etc/shadow:avr32:$1$TVWxUVs7$/ze18sFeD6F26w0hgyB6M.:13200:0:99999:7:::
target/device/Atmel/atngw100-expanded/target_skeleton/etc/shadow:root:$1$OJeedGT3$uG0eWkNhkeq0WO6Wldk1Y.:13200:0:99999:7:::
target/device/Atmel/atngw100-expanded/target_skeleton/etc/shadow:avr32:$1$TVWxUVs7$/ze18sFeD6F26w0hgyB6M.:13200:0:99999:7:::
target/device/Atmel/atngw100/target_skeleton/etc/shadow:root:$1$OJeedGT3$uG0eWkNhkeq0WO6Wldk1Y.:13200:0:99999:7:::
target/device/Atmel/atngw100/target_skeleton/etc/shadow:avr32:$1$TVWxUVs7$/ze18sFeD6F26w0hgyB6M.:13200:0:99999:7:::

are they there only to provide a backdoor into generated systems? :-)

Regards

Anders Blomdell

-- 
Anders Blomdell                  Email: anders.blomdell at control.lth.se
Department of Automatic Control
Lund University                  Phone:    +46 46 222 4625
P.O. Box 118                     Fax:      +46 46 138118
SE-221 00 Lund, Sweden
