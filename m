From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jul 2014 23:55:13 +0200
Subject: [Buildroot] [PATCH 33/53] libmms: add license information
In-Reply-To: <1403810481-10025-33-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 16:21:01 -0300")
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
 <1403810481-10025-33-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ha30eoce.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/libmms/libmms.mk | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/libmms/libmms.mk b/package/libmms/libmms.mk
 > index 405729f..445da7f 100644
 > --- a/package/libmms/libmms.mk
 > +++ b/package/libmms/libmms.mk
 > @@ -6,9 +6,9 @@
 
 >  LIBMMS_VERSION = 0.6.2
 >  LIBMMS_SITE = http://downloads.sourceforge.net/project/libmms/libmms/$(LIBMMS_VERSION)
 > -
 >  LIBMMS_INSTALL_STAGING = YES
 > -
 >  LIBMMS_DEPENDENCIES = host-pkgconf libglib2
 > +LIBMMS_LICENSE = LGPLv2.1
 > +LIBMMS_LICENSE_FILES = COPYING.LIB

It's not really clear, but I think this should be LGPLv2.1+.

Some files are copied from xine (which is GPLv2+), and README.LICENSE
just states that it is relicensed as LGPL, but all source files contain
the '(at your option) any later version' text (and GPL or LGPL header).

So I've changed this to '+' and committed, thanks.

-- 
Bye, Peter Korsgaard
