From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 17 Dec 2017 22:58:26 +0100
Subject: [Buildroot] [PATCH 1/2] iproute2: fix build with threads
 support disabled
In-Reply-To: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
References: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
Message-ID: <20171217215825.GA31927@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> iproute2 renamed the configure script generated file to config.mk.
> Update the berkeleydb disable code.

> Fixes:
> http://autobuild.buildroot.net/results/46d/46da1142806fb524326994585cec6de9f7f3f480/
> http://autobuild.buildroot.net/results/3aa/3aa028fe9e730335d2af00d5969b674a3d9f640b/

> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
Acked-by: Petr Vorel <petr.vorel@gmail.com>
