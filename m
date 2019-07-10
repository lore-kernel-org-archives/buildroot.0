From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 10 Jul 2019 17:44:53 +0200
Subject: [Buildroot] [PATCH] configs/beaglebone: increase rootfs image
 size
In-Reply-To: <20190710173853.1f96e165@gmx.net>
References: <1562705654-1620-1-git-send-email-pjtexier@koncepto.io>
 <20190710173853.1f96e165@gmx.net>
Message-ID: <e95daf58-b177-4fb0-db68-c06a815940b1@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 10/07/2019 ? 17:38, Peter Seiderer a ?crit?:
> Tested with buildroot master, no change:
> 
> 	$ make O=$PWD -C ../buildroot_git beaglebone_defconfig
> 	$ make
> 
> 	$ mount -t ext4 -o loop images/rootfs.ext4/mnt/
> 	$ df/mnt/
> Filesystem     1K-blocks  Used Available Use% Mounted on
> /dev/loop0         55397 15029     36068  30% /mnt
> 	$ umount /mnt
> 
> Still plenty of space available....
> 
> 	$ find . -name koi8_r.py
> 
> No koi8_r.py found, you enabled some additional options?

My bad, you are right, my workspace was not
totally clean ...

I will update the status to "Not Applicable".

Thanks for testing.

Regards,
Pierre-Jean

> 
> Regards,
> Peter

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
