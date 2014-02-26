From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 26 Feb 2014 09:54:21 +0100
Subject: [Buildroot] [PATCH] php-gnupg: new package
In-Reply-To: <1393359365-21266-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 25 Feb 2014 17:16:05 -0300")
References: <1393359365-21266-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <877g8igsoy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/Config.in              |  1 +
 >  package/php-gnupg/Config.in    |  9 +++++++++
 >  package/php-gnupg/php-gnupg.mk | 23 +++++++++++++++++++++++
 >  3 files changed, 33 insertions(+)
 >  create mode 100644 package/php-gnupg/Config.in
 >  create mode 100644 package/php-gnupg/php-gnupg.mk

Committed to next, thanks.

 > +++ b/package/php-gnupg/Config.in
 > @@ -0,0 +1,9 @@
 > +config BR2_PACKAGE_PHP_GNUPG
 > +	bool "php-gnupg"
 > +	depends on BR2_PACKAGE_PHP
 > +	depends on BR2_USE_MMU # libassuan

Does php really work on nonmmu?

-- 
Bye, Peter Korsgaard
