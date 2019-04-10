From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 12:03:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/gettext-gnu: Fix typo
 BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL
In-Reply-To: <20190408002821.12763-1-vadim4j@gmail.com>
References: <20190408002821.12763-1-vadim4j@gmail.com>
Message-ID: <20190410120337.1c61aead@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 03:28:21 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> After commit:
> 
> 	ea1e7ee606 package/gettext: turn into virtual package
> 
> package/gettext was renamed to package/gettext-gnu and introduced typo
> BR2_PACKAGE_GETTEXT_GNU_PROVIDES_LIBINTL which should be
> BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL (w/o "_GNU" part).
> 
> Reported-by: Romain Naour <romain.naour@gmail.com>
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  package/gettext-gnu/gettext-gnu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
