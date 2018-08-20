From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 13:59:30 +0200
Subject: [Buildroot] [PATCH 04/18] perl-time-parsedate: new package
In-Reply-To: <20180820115519.24046-5-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-5-chrismcc@gmail.com>
Message-ID: <20180820135930.67c124db@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Aug 2018 04:55:05 -0700, Christopher McCrory wrote:

> +PERL_TIME_PARSEDATE_VERSION = 2015.103
> +PERL_TIME_PARSEDATE_SOURCE = Time-ParseDate-$(PERL_TIME_PARSEDATE_VERSION).tar.gz
> +PERL_TIME_PARSEDATE_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MU/MUIR/modules
> +PERL_TIME_PARSEDATE_LICENSE_FILES = README
> +PERL_TIME_PARSEDATE_LICENSE = unknown

Could you check with upstream what is the license ? An unknown license
means you're not allow to redistribute it, which would be a bit
annoying, no ?

Here is what Debian says about the license:

  https://metadata.ftp-master.debian.org/changelogs/main/libt/libtime-parsedate-perl/libtime-parsedate-perl_2015.103-2_copyright

I.e:

 License hereby granted for anyone to use, modify or redistribute this module
 at their own risk. Please feed useful changes back to cpan at dave.sharnoff.org.

So, "Time::ParseDate License" ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
