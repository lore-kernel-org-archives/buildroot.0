From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 23:11:34 +0100
Subject: [Buildroot] [PATCH v2 0/8] Remove uClibc version selection:
 always use uClibc-ng
In-Reply-To: <20160127214907.GZ17143@waldemar-brodkorb.de>
References: <1453929930-18215-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160127214907.GZ17143@waldemar-brodkorb.de>
Message-ID: <20160127231134.58d0c154@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 27 Jan 2016 22:49:07 +0100, Waldemar Brodkorb wrote:

> > Since April 2015, the uClibc-ng has done very regular releases of the
> > uClibc C library, and is the de-facto active replacement of the now
> > defunct uClibc project.
> 
> Just a small adjustment. The first release made @Fosdem time in
> February (maybe the directory time on the server was misleading):
> http://uclibc-ng.org/wiki/WikiStart?action=diff&version=22

Ah, thanks for the info! So it's been exactly one year that uClibc-ng
has done its first release. Happy birthday :-)

> MIPS{32,64}r6 support was added in the latest release, may be
> we can enable it with this patch series?

It would be good to enable it of course, but it's the matter of a
separate patch / series. This series is solely about dropping support
for uClibc versioning, keeping only uClibc-ng. I don't like to extend
the scope of patch series between iterations, otherwise they never get
merged because they are always changing.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
