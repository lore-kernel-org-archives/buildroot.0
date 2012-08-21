From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Aug 2012 13:19:48 +0200
Subject: [Buildroot] [PATCH 01/10] perl: new package
In-Reply-To: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
References: <1345452909-15756-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120821131948.5e59085b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

Le Mon, 20 Aug 2012 10:55:00 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> ---
>  package/Config.in                      |    1 +
>  package/perl/Config.in                 |   16 +++++
>  package/perl/perl-Makefile-SH.patch    |   28 ++++++++
>  package/perl/perl-configure-qemu.patch |   22 +++++++
>  package/perl/perl-fix-minitest.patch   |   96 +++++++++++++++++++++++++++
>  package/perl/perl-make-ext.patch       |   35 ++++++++++
>  package/perl/perl-mkppport.patch       |   36 ++++++++++
>  package/perl/perl.mk                   |  112 ++++++++++++++++++++++++++++++++
>  8 files changed, 346 insertions(+)
>  create mode 100644 package/perl/Config.in
>  create mode 100644 package/perl/perl-Makefile-SH.patch
>  create mode 100644 package/perl/perl-configure-qemu.patch
>  create mode 100644 package/perl/perl-fix-minitest.patch
>  create mode 100644 package/perl/perl-make-ext.patch
>  create mode 100644 package/perl/perl-mkppport.patch
>  create mode 100644 package/perl/perl.mk

Thanks for this work on Perl. However, I find it lacks a bit of
background information. What is your patch series doing? Why would we
want to have three separate packages for Perl (perl, miniperl and
microperl)? We need some details to understand what you're proposing.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
