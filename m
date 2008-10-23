From: =?iso-8859-1?Q?Arnar_Mar_Sigur=F0sson?= <antab@valka.is>
Date: Thu, 23 Oct 2008 14:47:13 -0000
Subject: [Buildroot] Backdoors?
References: <48FD816A.6050101@control.lth.se>
Message-ID: <061E11D86E3DFF459604DF5B36F0805F1BA6BF@salka01.valka.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

root/v100sc2
valka/valka00
Documented as default password in our internel docs, but forgot to add a README about them here. I'll make them blank when i update the target skeleton soon.

Greets
   Arnar Mar Sig

-----Original Message-----
From: buildroot-bounces@uclibc.org on behalf of Anders Blomdell
Sent: Tue 10/21/2008 7:14 AM
To: buildroot at uclibc.org
Subject: [Buildroot] Backdoors?
 
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
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081023/8f7d41c7/attachment-0001.htm 
