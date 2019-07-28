From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Sun, 28 Jul 2019 14:33:27 +0200
Subject: [Buildroot] [PATCH] configs/atmel_sama5d27_som1: bump to
 linux4sam_6.1
In-Reply-To: <20190726162711.2c4ede9a@windsurf>
References: <1562775673-22148-1-git-send-email-pjtexier@koncepto.io>
 <20190726162711.2c4ede9a@windsurf>
Message-ID: <2915f499-4364-e4c7-9c19-b45892568565@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Le 26/07/2019 ? 16:27, Thomas Petazzoni a ?crit?:
> Following this bump, the atmel_sama5d27_som1_ek_mmc_dev_defconfig no
> longer builds:
> 
>    https://gitlab.com/buildroot.org/buildroot/-/jobs/259847527
> 
> You need to add:
>   
>    BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
> 
> Could you test this and send a patch ?

Interesting, I hadn't encountered this problem.
I'll send a patch to fix this issue.

Thanks !

Pierre-Jean

> 
> Thanks!
> 
> Thomas

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
