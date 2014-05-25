From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 25 May 2014 22:09:20 +0200
Subject: [Buildroot] [PATCH] acl: add license information
In-Reply-To: <1400937412-9808-1-git-send-email-abrahamh@web.de> (Heiko
 Abraham's message of "Sat, 24 May 2014 15:16:52 +0200")
References: <1400937412-9808-1-git-send-email-abrahamh@web.de>
Message-ID: <87ha4d8vtb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Heiko" == Heiko Abraham <abrahamh@web.de> writes:

 > Add missing license info and file for package 'acl'
 > ---
 >  package/acl/acl.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/acl/acl.mk b/package/acl/acl.mk
 > index 130ad10..684eb20 100644
 > --- a/package/acl/acl.mk
 > +++ b/package/acl/acl.mk
 > @@ -10,6 +10,8 @@ ACL_SITE = http://download.savannah.gnu.org/releases/acl
 >  ACL_INSTALL_STAGING = YES
 >  ACL_DEPENDENCIES = attr
 >  ACL_CONF_OPT = --enable-gettext=no
 > +ACL_LICENSE = GPLv2, LGPLv2.1
 > +ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL

Most (if not all) source files contain the 'or (at your option) any later
version' string, so I've changed these to GPLv2+, LGPLv2.1+ and
committed, thanks.

-- 
Bye, Peter Korsgaard
