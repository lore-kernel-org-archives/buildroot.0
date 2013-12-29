From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Dec 2013 13:33:54 +0100
Subject: [Buildroot] [PATCH] gstreamer1: fix xtensa configure
In-Reply-To: <41082d0245c6e32e5aea85b4879057c4f2b47665.1388316655.git.baruch@tkos.co.il>
References: <41082d0245c6e32e5aea85b4879057c4f2b47665.1388316655.git.baruch@tkos.co.il>
Message-ID: <20131229133354.7703145f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Sun, 29 Dec 2013 13:30:55 +0200, Baruch Siach wrote:
> Disable unaligned access to avoid configure run test.
> 
> Fixes
> http://autobuild.buildroot.net/results/1fb/1fb5bde77ea84f13fe8db7dedda5b8a29671b939/.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
