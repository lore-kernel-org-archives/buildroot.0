From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 17:49:52 +0200
Subject: [Buildroot] [PATCH 14/24] perl-file-util: drop unused host
 variant
In-Reply-To: <645482902.7741906.1467559322826.JavaMail.zimbra@datacom.ind.br>
References: <1467207991-4905-1-git-send-email-julien.floret@6wind.com>
 <1467207991-4905-15-git-send-email-julien.floret@6wind.com>
 <645482902.7741906.1467559322826.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160703174952.59ae3aa6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 3 Jul 2016 12:22:02 -0300 (BRT), Carlos Santos wrote:

> > diff --git a/package/perl-file-util/perl-file-util.mk
> > b/package/perl-file-util/perl-file-util.mk
> > index 7026515e6649..fe83585f3614 100644
> > --- a/package/perl-file-util/perl-file-util.mk
> > +++ b/package/perl-file-util/perl-file-util.mk
> > @@ -10,7 +10,5 @@ PERL_FILE_UTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/T/TO/TOMMY
> > PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
> > PERL_FILE_UTIL_LICENSE = Artistic or GPLv1+
> > PERL_FILE_UTIL_LICENSE_FILES = COPYING LICENSE
> > -HOST_PERL_FILE_UTIL_DEPENDENCIES = host-perl-module-build
> > 
> > $(eval $(perl-package))
> > -$(eval $(host-perl-package))
> > --
> > 2.1.0  
> 
> Not again, please!

All those patches have already been marked rejected, so no worries.

We are still wondering how to deal with those "orphan" host packages
though.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
