From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Dec 2017 10:16:49 +0100
Subject: [Buildroot] [PATCH 1/2] iproute2: fix build with threads
 support disabled
In-Reply-To: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
References: <12bbbd716a1599907414d2a419430a7ad10e5520.1513547304.git.baruch@tkos.co.il>
Message-ID: <20171218101649.58f8d2d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 23:48:23 +0200, Baruch Siach wrote:
> iproute2 renamed the configure script generated file to config.mk.
> Update the berkeleydb disable code.
> 
> Fixes:
> http://autobuild.buildroot.net/results/46d/46da1142806fb524326994585cec6de9f7f3f480/
> http://autobuild.buildroot.net/results/3aa/3aa028fe9e730335d2af00d5969b674a3d9f640b/
> 
> Cc: Petr Vorel <petr.vorel@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/iproute2/iproute2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
