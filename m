From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:37:30 +0200
Subject: [Buildroot] [PATCH 2/2] perl-cross: bump to version 0.8.5
In-Reply-To: <1398006356-5425-2-git-send-email-francois.perrad@gadz.org>
References: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
 <1398006356-5425-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140420173730.1770c6e1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sun, 20 Apr 2014 17:05:56 +0200, Francois Perrad wrote:

> -PERL_CROSS_VERSION = 0.8.3
> -PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).1
> -PERL_CROSS_SITE    = http://download.berlios.de/perlcross
> +PERL_CROSS_VERSION = 0.8.5
> +PERL_CROSS_BASE_VERSION = 5.$(PERL_VERSION_MAJOR).2
> +PERL_CROSS_SITE    = http://raw.github.com/arsv/perl-cross/releases

You should use the $(github ...) helper here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
