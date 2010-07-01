From: Mohamed Mohamed Nour El-Din <eng.mohamed.nour.eldin@gmail.com>
Date: Thu, 1 Jul 2010 10:42:45 +0300
Subject: [Buildroot] kernel modules & embedded linux
In-Reply-To: <AANLkTilauXcR4dwy7PUrelaKdREP4xgMBad2i0ixYfqG@mail.gmail.com>
References: <AANLkTilauXcR4dwy7PUrelaKdREP4xgMBad2i0ixYfqG@mail.gmail.com>
Message-ID: <AANLkTikCi6vziDJANiDx03Fhic26UKGCg2dyn6ZrdU9K@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
i'm working on an embedded linux project on mini2440 arm-s3c2440 board for
my graduation,
my system consists of:
u-boot deployed on the nand flash memory,
the linux kernel image deployed on a partition of an sd-card,
a root fs made using buildroot deployed on another partition of the sd-card,
what i'm facing is that lsmod doesn't give any output, i can't get any info
about automatically loaded modules, only i can list the modules loaded
manually using insmod or modprobe
also there's no modules.conf file in /etc
can u help me with that?
thnx a lot,

regards,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100701/48b4351d/attachment.html>
