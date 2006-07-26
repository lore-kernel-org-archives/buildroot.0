From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed Jul 26 07:25:29 2006
Subject: [Buildroot] HowTo make jffs2 image after linux.mk?
Message-ID: <20060726135221.GB8832@synertronixx3>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Folks!

Actually I am going into production with a buildroot tree
advanced by target/device/vendor/product subdirectory :)

Well, I adapted a linux-mk for my needs and the function is quite handy.

But what is the best way to create a jffs2 image _after_ compiling
kernel modules? 

The only chance I see is to move "source "target/device/Config.in""
just above "source "target/jffs2/Config.in"" but that looks rather ugly
and hackish. 

Is there a more canonical way to do this?

Regards, Konstantin Kletschke

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
