From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 25 Jun 2014 17:03:44 +0200
Subject: [Buildroot] [PATCH] whois: new package
In-Reply-To: <1403644615-11634-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 Jun 2014 18:16:55 -0300")
References: <1403644615-11634-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87d2dxxc8f.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in       |  1 +
 >  package/whois/Config.in |  7 +++++++
 >  package/whois/whois.mk  | 40 ++++++++++++++++++++++++++++++++++++++++
 >  3 files changed, 48 insertions(+)
 >  create mode 100644 package/whois/Config.in
 >  create mode 100644 package/whois/whois.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index b839512..838e822 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -1047,6 +1047,7 @@ endif
 >  	source "package/vtun/Config.in"
 >  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 >  	source "package/wget/Config.in"
 > +	source "package/whois/Config.in"

Committed with Arnout's feedback taken into consideration, thanks.

-- 
Bye, Peter Korsgaard
