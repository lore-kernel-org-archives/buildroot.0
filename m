From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jun 2014 17:00:25 +0200
Subject: [Buildroot] [PATCH 36/54] socketcand: add license information
In-Reply-To: <1403636160-11807-36-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 15:55:42 -0300")
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-36-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87k383pvg6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/socketcand/socketcand.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
 > index fdba96e..51aa224 100644
 > --- a/package/socketcand/socketcand.mk
 > +++ b/package/socketcand/socketcand.mk
 > @@ -7,6 +7,7 @@
 >  SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
 >  SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 >  SOCKETCAND_AUTORECONF = YES
 > +SOCKETCAND_LICENSE = BSD-3c or GPLv2

While not a true license file, I think it makes sense to point
_LICENSE_FILES to socketcand.c as it has all the needed details.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
