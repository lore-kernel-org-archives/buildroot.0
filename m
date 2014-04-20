From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 17:38:31 +0200
Subject: [Buildroot] [PATCH 1/2] pkg-perl: fix for Perl XS packages
 configured by a Makefile.PL
In-Reply-To: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
References: <1398006356-5425-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140420173831.49d0cb23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Sun, 20 Apr 2014 17:05:55 +0200, Francois Perrad wrote:
> for native package, ExtUtils::MakeMaker detects all include filenames on system perl,
> all these includes will be required by the generated Makefile but on STAGING_DIR.
> 
> patchlevel-debian.h is not a part of the Perl distribution,
> but it was added by some Linux distributions (Debian, Ubuntu, ...)
> In this case, we create an empty file on STAGING_DIR.

I'm sorry, but unfortunately, I don't understand this explanation. How
the fact that a header file is added by Linux distributions affecting
Buildroot? What package needs that? Which problem is this fixing?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
