From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:25:29 +0200
Subject: [Buildroot] [PATCH 03/20] perl-devel-stacktrace-ashtml: new
 package
In-Reply-To: <20181006165524.23778-4-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-4-francois.perrad@gadz.org>
Message-ID: <20181008102529.0f68c401@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:07 +0200, Francois Perrad wrote:

> +PERL_DEVEL_STACKTRACE_ASHTML_VERSION = 0.15
> +PERL_DEVEL_STACKTRACE_ASHTML_SOURCE = Devel-StackTrace-AsHTML-$(PERL_DEVEL_STACKTRACE_ASHTML_VERSION).tar.gz
> +PERL_DEVEL_STACKTRACE_ASHTML_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
> +PERL_DEVEL_STACKTRACE_ASHTML_DEPENDENCIES = perl-devel-stacktrace

Is perl-devel-stacktrace really a build dependency ? Or just a runtime
dependency ?

I've applied as-is, but if it's only a runtime dependency, it would be
good to drop this line in a follow-up. Thanks!

In general, is there a way to easily check if a Perl dependency is
built time or run time ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
