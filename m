From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 Jan 2014 23:49:21 +0100
Subject: [Buildroot] [PATCH v3 1/1] minidlna: bump version to 1.1.1
In-Reply-To: <BLU0-SMTP1012F758793A211AEB40D12D9CA0@phx.gbl> (Bernd Kuhls's
 message of "Fri, 3 Jan 2014 21:20:45 +0100")
References: <BLU0-SMTP1012F758793A211AEB40D12D9CA0@phx.gbl>
Message-ID: <87d2k3wgpa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <berndkuhls@hotmail.com> writes:

 > - remove all patches needed for pre-autotools minidlna release
 > - convert .mk file to autotools-package
 > - disable broken static build

It doesn't seem too hard to fix, but ok - I can look into that later.

 > -MINIDLNA_VERSION = 1.0.26
 > +MINIDLNA_VERSION = 1.1.1
 >  MINIDLNA_SITE = http://downloads.sourceforge.net/project/minidlna/minidlna/$(MINIDLNA_VERSION)
 >  MINIDLNA_LICENSE = GPLv2 BSD-3c
 >  MINIDLNA_LICENSE_FILES = LICENCE LICENCE.miniupnpd

The GPLv2 license file got renamed to COPYING.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
