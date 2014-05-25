From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 May 2014 22:25:40 +0200
Subject: [Buildroot] [PATCH] attr: add license information
In-Reply-To: <1400937661-10089-1-git-send-email-abrahamh@web.de> (Heiko
 Abraham's message of "Sat, 24 May 2014 15:21:01 +0200")
References: <1400937661-10089-1-git-send-email-abrahamh@web.de>
Message-ID: <87d2f18v23.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Abraham <abrahamh@web.de> writes:

 > Add missing license info and file for package 'attr'
 > ---
 >  package/attr/attr.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/attr/attr.mk b/package/attr/attr.mk
 > index f7179a2..9118cf9 100644
 > --- a/package/attr/attr.mk
 > +++ b/package/attr/attr.mk
 > @@ -9,6 +9,8 @@ ATTR_SOURCE = attr-$(ATTR_VERSION).src.tar.gz
 >  ATTR_SITE = http://download.savannah.gnu.org/releases/attr
 >  ATTR_INSTALL_STAGING = YES
 >  ATTR_CONF_OPT = --enable-gettext=no
 > +ATTR_LICENSE = GPLv2 LGPGv2.1
 > +ATTR_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL

Same comment as for acl. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
