From: forumadresse at gmx-topmail.de <forumadresse@gmx-topmail.de>
Date: Tue, 22 Jan 2008 21:02:06 +0100
Subject: [Buildroot] netWifiMicroSD network driver
Message-ID: <20080122200206.209510@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a gumstix verdex and a netwifimicroSD-EU Expansion Board. After running buildroot ("make") I need to change the driver for the ethernet controller. Default is smc91x and the expansion board needs the smc911x. So I go to "/gumstix-buildroot/build_arm_nofpu/linux-2.6.21gum" an run "make menuconfig". But there is non of these two drivers at "DeviceDriver -> Network Device Support -> Ethernet (10 or 100Mbit) ->". The only option is "Generic Media Independent Interface device support". But I found some manuals, which tells me that there has to be the network driver. What am I doing wrong? I searched the whole menu, but I haven't found the right driver yet.

Greets,

Oliver
-- 
GMX FreeMail: 1 GB Postfach, 5 E-Mail-Adressen, 10 Free SMS.
Alle Infos und kostenlose Anmeldung: http://www.gmx.net/de/go/freemail
