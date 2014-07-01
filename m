From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 00:43:13 +0200
Subject: [Buildroot] [PATCH 50/53] udpcast: add license information
In-Reply-To: <1403810481-10025-50-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 16:21:18 -0300")
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
 <1403810481-10025-50-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874mz0em4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/udpcast/udpcast.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/udpcast/udpcast.mk b/package/udpcast/udpcast.mk
 > index 786a88e..0cd3b27 100644
 > --- a/package/udpcast/udpcast.mk
 > +++ b/package/udpcast/udpcast.mk
 > @@ -7,6 +7,8 @@
 >  UDPCAST_VERSION = 20120424
 >  UDPCAST_SITE = http://www.udpcast.linux.lu/download
 >  UDPCAST_DEPENDENCIES = host-m4
 > +UDPCAST_LICENSE = BSD-2c, GPLv2
 > +UDPCAST_LICENSE_FILES = COPYING

fec.c::fec_license() lists it as GPLv2+, so I've fixed that and
committed, thanks.

 
 >  define UDPCAST_REMOVE_UDP_SENDER
 >  	rm -f $(TARGET_DIR)/usr/sbin/udp-sender
 > -- 
 > 1.8.5.5

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
