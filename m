From: Ted Wood <ted@fgh.co.uk>
Date: Thu, 13 Dec 2012 16:00:34 -0000
Subject: [Buildroot] Getting It into Compact Flash
In-Reply-To: <20121213132615.GA21579@mail.sceen.net>
References: <000901cdd883$889a6e70$99cf4b50$@co.uk>
 <20121212162225.GA15887@mail.sceen.net>
 <20121212204922.GA1265@mail.sceen.net>
 <000301cdd91f$572b9520$0582bf60$@co.uk>
 <20121213113223.GA13939@mail.sceen.net>
 <000b01cdd932$eb5179f0$c1f46dd0$@co.uk>
 <20121213132615.GA21579@mail.sceen.net>
Message-ID: <001f01cdd94a$fcc700c0$f6550240$@co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >ext3 too (CONFIG_EXT4_USE_FOR_EXT23). There is currently no way to 
> >build an ext3 or ext4 image (you need to use tune2fs with some magic 
> >to enable the new features), but with the configuration I'm 
> >suggesting, you'll have good support for every ext file system.


OK. Got it. Understood. Thank you.

It now boots but does not open a login shell. 

menuConfig has a default login terminal ttyS0 - presumably this is for a
serial port?

Code is running on an i586 single board computer with keyboard and monitor
connected


I've tried building the code for tty0 and tty1.
