From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:49:39 +0200
Subject: [Buildroot] [PATCH 14/17] perl-x10: new package
In-Reply-To: <20180811182749.20924-15-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-15-chrismcc@gmail.com>
Message-ID: <20180813234939.284f9d10@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 11:27:46 -0700, Christopher McCrory wrote:
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

This one depends on perl-time-parsedate, which I couldn't merge due to
the licensing issue. So I've marked this one as "Changes Requested" as
well.

Please include Fran?ois Acked-by next time you resend this patch.

> +PERL_X10_VERSION = 0.04
> +PERL_X10_SOURCE = X10-$(PERL_X10_VERSION).tar.gz
> +PERL_X10_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RO/ROBF
> +PERL_X10_DEPENDENCIES = perl-astro-suntime perl-device-serialport perl-time-parsedate
> +PERL_X10_LICENSE = gpl_3

This is not a correct SPDX tag. If it's indeed GPLv3, then it should be
GPL-3.0.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
