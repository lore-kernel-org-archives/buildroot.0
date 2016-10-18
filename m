From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Oct 2016 22:14:31 +0200
Subject: [Buildroot] [PATCH] beaglebone_defconfig: select ext4 as rootfs
In-Reply-To: <1476820313-27600-1-git-send-email-lothar.felten@gmail.com>
 (Lothar Felten's message of "Tue, 18 Oct 2016 21:51:53 +0200")
References: <1476820313-27600-1-git-send-email-lothar.felten@gmail.com>
Message-ID: <8737jth0t4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lothar" == Lothar Felten <lothar.felten@gmail.com> writes:

 > beaglebone_defconfig and beaglebone_qt5_defconfig:
 > Select ext4 as root file system as the genimage config expects ext4 not ext2
 > Tested on beaglebone, beagleboneblack and AM335x EVM

Committed after rewording the commit message slightly, thanks.

-- 
Bye, Peter Korsgaard
