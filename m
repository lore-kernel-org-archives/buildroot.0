From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jun 2014 22:47:57 +0200
Subject: [Buildroot] [PATCH 12/54] libhid: add license information
In-Reply-To: <1403636160-11807-12-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 15:55:18 -0300")
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-12-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877g44vhqa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/libhid/libhid.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
 > index 30501d5..469a607 100644
 > --- a/package/libhid/libhid.mk
 > +++ b/package/libhid/libhid.mk
 > @@ -9,6 +9,8 @@ LIBHID_SITE = http://sources.buildroot.net/
 >  LIBHID_DEPENDENCIES = libusb-compat libusb
 >  LIBHID_INSTALL_STAGING = YES
 >  LIBHID_AUTORECONF = YES
 > +LIBHID_LICENSE = GPLv2
 > +LIBHID_LICENSE_FILES = COPYING

There's actually also a hidparsers/COPYING with some trivial
differences, and those files are explicitly marked as GPLv2+, but I
guess libhid as a whole is just GPLv2 - So I guess it is ok.

Committed, thanks.

-- 
Bye, Peter Korsgaard
