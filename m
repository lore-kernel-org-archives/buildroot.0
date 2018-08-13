From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Aug 2018 23:46:58 +0200
Subject: [Buildroot] [PATCH 13/17] perl-time-parsedate: new package
In-Reply-To: <20180811182749.20924-14-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-14-chrismcc@gmail.com>
Message-ID: <20180813234658.0a19b4f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 11 Aug 2018 11:27:45 -0700, Christopher McCrory wrote:

> +PERL_TIME_PARSEDATE_VERSION = 2015.103
> +PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
> +PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
> +PERL_TIME_PARSEDATE_LICENSE_FILES = README

This file doesn't contain any license information. In fact, this module
has no license at all. Even CPAN says the license is "unknown". I've
filled a bug report upstream about this:

  https://github.com/muir/Time-modules/issues/9

In the mean time, I've marked this patch as "Changes Requested".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
