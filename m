From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Oct 2017 11:01:28 +0200
Subject: [Buildroot] [PATCH] qemu: security bump to version 2.8.1.1
In-Reply-To: <20171004082217.o2yzbrwjdpicpe4r@tarshish> (Baruch Siach's
 message of "Wed, 4 Oct 2017 11:22:17 +0300")
References: <20171004071357.15093-1-peter@korsgaard.com>
 <20171004082217.o2yzbrwjdpicpe4r@tarshish>
Message-ID: <87mv579thz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> -QEMU_VERSION = 2.8.0
 >> +QEMU_VERSION = 2.8.1.1
 >> QEMU_SOURCE = qemu-$(QEMU_VERSION).tar.bz2

 > There is also a .xz tarball available.

 >> QEMU_SITE = http://wiki.qemu.org/download

 > This redirects to https://download.qemu.org.

Correct (for both). I wanted to keep the security bump as minimal as
possible for backport to 2017.02.x, but I can send a followup patch to
change to .xz / download.qemu.org.

Thanks for the review!

-- 
Bye, Peter Korsgaard
