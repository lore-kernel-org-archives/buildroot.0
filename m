From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:00:22 +0100
Subject: [Buildroot] [PATCH] xdriver_xf86-video-ati: needs dri3proto for
 glamor
In-Reply-To: <1458334522-22176-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458334522-22176-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160320180022.5fd6015e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Mar 2016 17:55:22 -0300, Gustavo Zacarias wrote:
> We need to match xserver here, since we need glamor support there in
> order to enable it here, hence need to match the dependencies.
> For xserver it needs dri3proto+libepoxy, however if only libepoxy is
> present then glamor would be disabled for the server but enabled for the
> driver, leading to build failure.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
