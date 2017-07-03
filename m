From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Jul 2017 14:57:33 +0200
Subject: [Buildroot] [PATCH] tslib: use SPDX identifiers for licenses in
	use
In-Reply-To: <20170703075008.18255-1-martink@posteo.de> (Martin Kepplinger's
 message of "Mon, 3 Jul 2017 09:50:08 +0200")
References: <20170703075008.18255-1-martink@posteo.de>
Message-ID: <87eftx8ypu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Kepplinger <martink@posteo.de> writes:

 > Signed-off-by: Martin Kepplinger <martink@posteo.de>
 > ---
 >  package/tslib/tslib.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
 > index 91ba9db39..936243154 100644
 > --- a/package/tslib/tslib.mk
 > +++ b/package/tslib/tslib.mk
 > @@ -7,7 +7,7 @@
 >  TSLIB_VERSION = 1.11
 >  TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)
 >  TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 > -TSLIB_LICENSE = GPL, LGPL
 > +TSLIB_LICENSE = GPL-2.0 (programs), LGPL-2.1 (libraries)

I see the 'or (at your option) any later version' string in both tools/
and src/, so I've changed this to GPL-2.0+ / LGPL-2.1+ and committed,
thanks.

-- 
Bye, Peter Korsgaard
