From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 23:46:18 +0200
Subject: [Buildroot] [PATCH 1/4] aiccu: remove redundant --static flag
 to pkg-config
In-Reply-To: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
References: <1437937112-13269-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20150726234618.57d4f61e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 26 Jul 2015 20:58:29 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> The pkg-config tool is automatically passing --static when BR2_STATIC_LIBS
> is set (see package/pkgconf/pkgconf.mk), so no need to pass it explicitly
> from package .mk files.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> ---
>  package/aiccu/aiccu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All four patches applied, thanks. Thanks also to Yann for the review,
and the discussion on IRC leading to those clean up patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
