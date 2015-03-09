From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 09 Mar 2015 22:59:17 +0100
Subject: [Buildroot] [PATCH 1/1] ustr: fix license name
In-Reply-To: <1425935373-43108-1-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 9 Mar 2015 16:09:33 -0500")
References: <1425935373-43108-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87egoxrfwq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/ustr/ustr.mk | 2 +-
 >  1 file changed, 1 insertion(+), 1 deletion(-)

 > diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
 > index ac1fa05..c2a819f 100644
 > --- a/package/ustr/ustr.mk
 > +++ b/package/ustr/ustr.mk
 > @@ -8,7 +8,7 @@ USTR_VERSION = 1.0.4
 >  USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
 >  USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)/
 >  USTR_LICENSE = BSD-2c MIT LGPLv2+
 > -USTR_LICENSE_FILES = LICENCE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
 > +USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT

It took me a few minutes of staring to see where the difference was
(please consider writing a more complete commit message in the future).

Committed, thanks.

-- 
Bye, Peter Korsgaard
