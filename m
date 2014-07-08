From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Jul 2014 00:04:26 +0200
Subject: [Buildroot] [PATCH 10/13] linux-fusion: add license information
In-Reply-To: <1404304811-27480-10-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jul 2014 09:40:08 -0300")
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
 <1404304811-27480-10-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pphfv76d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/linux-fusion/linux-fusion.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/linux-fusion/linux-fusion.mk b/package/linux-fusion/linux-fusion.mk
 > index 635e07f..120ad95 100644
 > --- a/package/linux-fusion/linux-fusion.mk
 > +++ b/package/linux-fusion/linux-fusion.mk
 > @@ -8,6 +8,8 @@ LINUX_FUSION_VERSION = 9.0.2
 >  LINUX_FUSION_SITE = http://directfb.org/downloads/Core/linux-fusion
 >  LINUX_FUSION_INSTALL_STAGING = YES
 >  LINUX_FUSION_DEPENDENCIES = linux
 > +LINUX_FUSION_LICENSE = LGPLv2+
 > +LINUX_FUSION_LICENSE_FILES = debian/copyright

That file (and others) state GPLv2+, so I've changed it to that and
committed, thanks.

-- 
Bye, Peter Korsgaard
