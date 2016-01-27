From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 27 Jan 2016 22:49:07 +0100
Subject: [Buildroot] [PATCH v2 0/8] Remove uClibc version selection:
 always use uClibc-ng
In-Reply-To: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160127214907.GZ17143@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> Since April 2015, the uClibc-ng has done very regular releases of the
> uClibc C library, and is the de-facto active replacement of the now
> defunct uClibc project.

Just a small adjustment. The first release made @Fosdem time in
February (maybe the directory time on the server was misleading):
http://uclibc-ng.org/wiki/WikiStart?action=diff&version=22

MIPS{32,64}r6 support was added in the latest release, may be
we can enable it with this patch series?

best regards
 Waldemar
