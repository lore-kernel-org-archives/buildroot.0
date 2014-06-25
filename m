From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jun 2014 22:50:08 +0200
Subject: [Buildroot] [PATCH 13/54] libical: add license information
In-Reply-To: <20140624222117.GP31767@free.fr> (Yann E. MORIN's message of
 "Wed, 25 Jun 2014 00:21:17 +0200")
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
 <1403636160-11807-13-git-send-email-gustavo@zacarias.com.ar>
 <20140624222117.GP31767@free.fr>
Message-ID: <8738esvhmn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On 2014-06-24 15:55 -0300, Gustavo Zacarias spake thusly:
 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

 > LICENSE file, random files, yadda yadda... 

 > Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > But see below...

 >> ---
 >> package/libical/libical.mk | 2 ++
 >> 1 file changed, 2 insertions(+)
 >> 
 >> diff --git a/package/libical/libical.mk b/package/libical/libical.mk
 >> index cdee006..4025627 100644
 >> --- a/package/libical/libical.mk
 >> +++ b/package/libical/libical.mk
 >> @@ -7,5 +7,7 @@
 >> LIBICAL_VERSION = 0.48
 >> LIBICAL_SITE = http://downloads.sourceforge.net/project/freeassociation/libical/libical-$(LIBICAL_VERSION)
 >> LIBICAL_INSTALL_STAGING = YES
 >> +LIBICAL_LICENSE = MPLv1.0 or LGPLv2.1
 >> +LIBICAL_LICENSE_FILES = LICENSE

 > There's also a COPYING file, which content appear to be the exact same
 > as the LICENSE file. So, OK to get only one of them. I'd have prefered
 > COPYING, but that's equally equal. ;-)

LICENSE has a few extra lines clarifying the license, so I'll leave it
like this.

Committed, thanks.

-- 
Bye, Peter Korsgaard
