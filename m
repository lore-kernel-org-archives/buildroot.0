From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 May 2018 22:56:04 +0200
Subject: [Buildroot] [PATCH] ltrace: allow selection on aarch64
In-Reply-To: <20180514112421.29379-1-anssi.hannula@bitwise.fi>
References: <20180514112421.29379-1-anssi.hannula@bitwise.fi>
Message-ID: <20180519225604.4cf23389@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 May 2018 14:24:21 +0300, Anssi Hannula wrote:
> ltrace works fine on aarch64, so allow enabling it on that architecture.
> 
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
>  package/ltrace/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to next, thanks. While reviewing your patch, I noticed two
things that are bogus in package/ltrace/Config.in, so I sent patches to
fix them:

  https://patchwork.ozlabs.org/patch/916926/
  https://patchwork.ozlabs.org/patch/916927/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
