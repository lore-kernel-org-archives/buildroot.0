From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:14:08 +0200
Subject: [Buildroot] [PATCH 13/14] package/perl-sub-quote: bump to
 version 2.006003
In-Reply-To: <20190331174449.1461-13-francois.perrad@gadz.org>
References: <20190331174449.1461-1-francois.perrad@gadz.org>
 <20190331174449.1461-13-francois.perrad@gadz.org>
Message-ID: <20190401221408.3b03e5e5@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Mar 2019 19:44:48 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> -# computed by scancpan
> -sha256 8f7a1d60c718174b7752562007b2643d4a1c23f901cbeb7774015805efe0a817 README

Why is this being removed ?

> -PERL_SUB_QUOTE_VERSION = 2.005001
> +PERL_SUB_QUOTE_VERSION = 2.006003
>  PERL_SUB_QUOTE_SOURCE = Sub-Quote-$(PERL_SUB_QUOTE_VERSION).tar.gz
>  PERL_SUB_QUOTE_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
>  PERL_SUB_QUOTE_LICENSE = Artistic or GPL-1.0+
> -PERL_SUB_QUOTE_LICENSE_FILES = README

And here ?

The README file didn't change substantially, so I kept it as a license
file.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
