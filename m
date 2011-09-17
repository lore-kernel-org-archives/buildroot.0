From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 10:28:32 +0200
Subject: [Buildroot] xattr fs for raw flash
In-Reply-To: <CAH3pVZN04aTj-xj8_qbC+ZxCeq03WAr+1aRZ_Sf4f-g5xUw4sw@mail.gmail.com>
References: <CAH3pVZN04aTj-xj8_qbC+ZxCeq03WAr+1aRZ_Sf4f-g5xUw4sw@mail.gmail.com>
Message-ID: <20110917102832.34fe40ea@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 17 Sep 2011 11:59:15 +0400,
Sergey Naumov <sknaumov@gmail.com> a ?crit :

> Does anybody know raw-flash filesystems with xattr support?
> I know that jffs2 has but it has problems with mount time and memory
> consumption.
> I am interested in logFS but can't find any information about xattrs
> support.

UBIFS apparently has xattr support, even though I've never used it:

config UBIFS_FS_XATTR
        bool "Extended attributes support"
        depends on UBIFS_FS
        help
          This option enables support of extended attributes.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
