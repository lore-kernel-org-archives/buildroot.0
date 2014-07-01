From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 00:30:17 +0200
Subject: [Buildroot] [PATCH 39/53] pcmanfm: add license information
In-Reply-To: <1403810481-10025-39-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 16:21:07 -0300")
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
 <1403810481-10025-39-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2doempy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/pcmanfm/pcmanfm.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/pcmanfm/pcmanfm.mk b/package/pcmanfm/pcmanfm.mk
 > index 80eedd4..7e47f52 100644
 > --- a/package/pcmanfm/pcmanfm.mk
 > +++ b/package/pcmanfm/pcmanfm.mk
 > @@ -9,5 +9,7 @@ PCMANFM_SITE = http://downloads.sourceforge.net/project/pcmanfm/pcmanfm-legacy%2
 >  PCMANFM_CONF_OPT = --disable-hal
 >  PCMANFM_DEPENDENCIES = host-pkgconf libgtk2 gamin startup-notification xlib_libX11
 >  PCMANFM_AUTORECONF = YES
 > +PCMANFM_LICENSE = GPLv2
 > +PCMANFM_LICENSE_FILES = COPYING

Several of the source files, including the implementation of the about
box contains the '(at your option) any later version' text, so I think
this should be GPLv2+.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
