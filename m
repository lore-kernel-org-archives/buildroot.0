From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Wed, 02 Apr 2014 22:15:55 +0200
Subject: [Buildroot] [git commit master 1/1] Makefile.autotools.in: add
	libtool v2.4 support
References: <20110328194623.C0431819DC@busybox.osuosl.org>
Message-ID: <ro7u0bxr79.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@sunsite.dk> wrote in
news:20110328194623.C0431819DC at busybox.osuosl.org: 

> 
> commit:
> http://git.buildroot.net/buildroot/commit/?id=f055b266f11f8b72c60cf3b46bf
> 081aaf97f5f6d branch:
> http://git.buildroot.net/buildroot/commit/?id=refs/heads/master 
> 
> Packages (like avahi) are now using libtool 2.4, so extend the libtool
> handling to support those as well.

Hi,

just a small note: ltmain.sh supplied by freetype 2.5.3 is incompatible with
support/libtool/buildroot-libtool-v2.4.patch

Regards, Bernd
