From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Mon, 4 Dec 2017 23:17:29 +0300
Subject: [Buildroot] [PATCH 6/8] binaries-marvell: new package
In-Reply-To: <20171203214811.3124-7-thomas.petazzoni@free-electrons.com>
References: <20171203214811.3124-1-thomas.petazzoni@free-electrons.com>
 <20171203214811.3124-7-thomas.petazzoni@free-electrons.com>
Message-ID: <20171204201729.75rkuaihs65susqa@speedy.hunter>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> This package adds SCP_BL2 firmware for Marvell Armada 7040 and 8040 SoCs.
> 
> Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
> [Thomas:
>  - Use "binaries-marvell" in the Config.in prompt and in the .mk file
>    header.
>  - Change the license information.
>  - Adjust license information: it is GPL-2.0 with the FreeRTOS

Indeed, it looks like this firmware is based on FreeRTOS. Even
firmware blobs from 17.10 branch contain FreeRTOS strings. However
I would second the approach suggested by Baruch Siach: lets fall
back to a more conservative approach and specify PROPRIETARY until
we have a clarfication from Marvell.

Regards,
Sergey
