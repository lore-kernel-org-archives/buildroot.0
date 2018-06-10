From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Jun 2018 13:25:41 +0200
Subject: [Buildroot] [PATCH 1/2] package/speex: use pkgconf to detect
 libogg
In-Reply-To: <20180610101024.5035-1-bernd.kuhls@t-online.de>
References: <20180610101024.5035-1-bernd.kuhls@t-online.de>
Message-ID: <20180610132541.7247cb15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jun 2018 12:10:23 +0200, Bernd Kuhls wrote:
> Upstream removed with-ogg-* configure options and switched to pkgconf
> to detect libogg back in 2014:
> https://git.xiph.org/?p=speex.git;a=commitdiff;h=e1b1eeabce815283c5bbc42016a9d6a11eda2866
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/speex/speex.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Both applied, thanks. Could you try to resubmit the Thumb2 patch to
speex upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
