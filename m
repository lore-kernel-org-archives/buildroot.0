From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 15:42:44 +0200
Subject: [Buildroot] [PATCH 3/4] cloop: add license information
In-Reply-To: <1404417639-5879-3-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 3 Jul 2014 17:00:38 -0300")
References: <1404417639-5879-1-git-send-email-gustavo@zacarias.com.ar>
 <1404417639-5879-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877g3mtzqj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/cloop/cloop.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/cloop/cloop.mk b/package/cloop/cloop.mk
 > index adbd69a..fb0bdf3 100644
 > --- a/package/cloop/cloop.mk
 > +++ b/package/cloop/cloop.mk
 > @@ -7,6 +7,8 @@
 >  CLOOP_VERSION = 2.634-1
 >  CLOOP_SOURCE = cloop_$(CLOOP_VERSION).tar.gz
 >  CLOOP_SITE = http://debian-knoppix.alioth.debian.org/packages/sources/cloop
 > +CLOOP_LICENSE = GPLv2
 > +CLOOP_LICENSE_FILES = README

The kernel module is indeed GPLv2, but the advancecomp userspace stuff
is GPLv2+ (and has a COPYING), so I've extended it to also cover that.

Committed, thanks.

-- 
Bye, Peter Korsgaard
