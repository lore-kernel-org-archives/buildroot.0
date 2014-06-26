From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 26 Jun 2014 17:06:40 +0200
Subject: [Buildroot] [PATCH 42/54] transmission: add license information
In-Reply-To: <1403636160-11807-42-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 15:55:48 -0300")
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-42-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87tx77oglb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/transmission/transmission.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
 > index 37cc58b..f9fb9f8 100644
 > --- a/package/transmission/transmission.mk
 > +++ b/package/transmission/transmission.mk
 > @@ -15,10 +15,11 @@ TRANSMISSION_DEPENDENCIES = \
 >  	openssl \
 >  	zlib
 >  TRANSMISSION_AUTORECONF = YES
 > -
 >  TRANSMISSION_CONF_OPT = \
 >  	--disable-libnotify \
 >  	--enable-lightweight
 > +TRANSMISSION_LICENSE = GPLv2 or GPLv3

There's also an openssl exception, so I've added that.

-- 
Bye, Peter Korsgaard
