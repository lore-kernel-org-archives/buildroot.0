From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Jul 2014 23:51:08 +0200
Subject: [Buildroot] [PATCH 06/13] quota: add license information
In-Reply-To: <1404304811-27480-6-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 2 Jul 2014 09:40:04 -0300")
References: <1404304811-27480-1-git-send-email-gustavo@zacarias.com.ar>
 <1404304811-27480-6-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877g3nwmcz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/quota/quota.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/quota/quota.mk b/package/quota/quota.mk
 > index 4febb50..1cc96d7 100644
 > --- a/package/quota/quota.mk
 > +++ b/package/quota/quota.mk
 > @@ -8,6 +8,7 @@ QUOTA_VERSION = 4.00
 >  QUOTA_SITE = http://downloads.sourceforge.net/project/linuxquota/quota-tools/$(QUOTA_VERSION)
 >  QUOTA_DEPENDENCIES = host-gettext
 >  QUOTA_AUTORECONF = YES
 > +QUOTA_LICENSE = GPLv2+

Some of the files have BSD headers, but it is probably true that the
release as a whole most be GPLv2.

Committed, thanks.

-- 
Bye, Peter Korsgaard
