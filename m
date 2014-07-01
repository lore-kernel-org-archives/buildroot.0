From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 00:47:07 +0200
Subject: [Buildroot] [PATCH 53/53] xvkvd: add license information
In-Reply-To: <1403810481-10025-53-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Thu, 26 Jun 2014 16:21:21 -0300")
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
 <1403810481-10025-53-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87zjgsd7dg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

typo in $SUBJECT.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/xvkbd/xvkbd.mk | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/xvkbd/xvkbd.mk b/package/xvkbd/xvkbd.mk
 > index 15aa940..9d73590 100644
 > --- a/package/xvkbd/xvkbd.mk
 > +++ b/package/xvkbd/xvkbd.mk
 > @@ -6,6 +6,8 @@
 
 >  XVKBD_VERSION = 3.2
 >  XVKBD_SITE = http://homepage3.nifty.com/tsato/xvkbd
 > +XVKBD_LICENSE = GPLv2+
 > +XVKBD_LICENSE_FILES = xvkbd.c

README also contains the license info, so I've changed it to use that
instead and committed, thanks.

-- 
Bye, Peter Korsgaard
