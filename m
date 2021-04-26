From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Apr 2021 21:51:02 +0200
Subject: [Buildroot] [PATCH 0/4] imx: add i.MX 8M Plus Nitrogen support
In-Reply-To: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
References: <20210426153019.1431844-1-gary.bisson@boundarydevices.com>
Message-ID: <20210426215102.532bb6cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 26 Apr 2021 17:30:15 +0200
Gary Bisson <gary.bisson@boundarydevices.com> wrote:

> Gary Bisson (4):
>   board/boundarydevices: update boot scripts
>   configs/nitrogen*: update kernel to 5.4.x_2.3.0
>   configs/nitrogen*: bump u-boot revision
>   configs/nitrogen8mp: new defconfig

Thanks, series applied. Could you send a follow-up patch to PATCH 4/4
that extends board/boundarydevices/common/readme.txt to mention to
which board the new defconfig applies?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
