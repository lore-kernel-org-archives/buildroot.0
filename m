From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Nov 2014 22:29:28 +0100
Subject: [Buildroot] [PATCH] czmq: fix static build
In-Reply-To: <2ae14883aaaf95d9b8115ae50a2f17136c8315d1.1416754006.git.baruch@tkos.co.il>
References: <2ae14883aaaf95d9b8115ae50a2f17136c8315d1.1416754006.git.baruch@tkos.co.il>
Message-ID: <20141124222928.14e8c998@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 23 Nov 2014 16:46:46 +0200, Baruch Siach wrote:
> libstdc++ may also need -lm.
> 
> Fixes:
> http://autobuild.buildroot.net/results/aab/aab80285c54641fd7c217cdd45c4593e5c3a66c5/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/czmq/czmq.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

I really wish all those libraries would be using pkg-config instead...

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
