From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:29:14 +0100
Subject: [Buildroot] [PATCH 3/3] uclibc: add patch fixing non-threaded
 build on Xtensa for uClibc-ng 1.0.0
In-Reply-To: <20150307144013.GE4186@free.fr>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307144013.GE4186@free.fr>
Message-ID: <20150307172914.1ac65860@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 7 Mar 2015 15:40:13 +0100, Yann E. MORIN wrote:

> I know this is not the first patch we have against uClibc-ng, but what
> will happen when uClibc eventually tags 1.0.0? How will we differentiate
> the patch directories between uClibc-1.0.0 and uClibc-ng 1.0.0 ?

I thought about this, and one idea would be to have the version named
"ng-1.0.0" for the point of view of Buildroot, so that instead of using
uClibc-ng-$(UCLIBC_VERSION) or uClibc-$(UCLIBC_VERSION).

> (BTW, there's no bc8a6a6 commit upstream, it's b15663c)

bc8a6a6 is the commit ID once cherry-picked on top of a branch based on
v1.0.0, with the other uClibc-ng patch applied.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
