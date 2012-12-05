From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Dec 2012 07:30:18 -0800
Subject: [Buildroot] [PATCH] package/crosstool-ng: update to 1.17.0
In-Reply-To: <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
 (Carsten Schoenert's message of "Mon, 3 Dec 2012 20:47:45 +0100")
References: <1354564065-24388-1-git-send-email-c.schoenert@t-online.de>
 <1354564065-24388-2-git-send-email-c.schoenert@t-online.de>
Message-ID: <87624gbjp1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

 Carsten> From: Carsten Schoenert <c.schoenert@t-online.de>
 Carsten> Updating current crosstool-ng config files to 1.17.0
 Carsten>  crosstool-ng.config-eglibc
 Carsten>  crosstool-ng.config-glibc
 Carsten>  crosstool-ng.config-uClibc

Committed, thanks.

The change to defconfig can happen later.

 Carsten>  #
 Carsten>  # C compiler
 Carsten> @@ -242,6 +267,7 @@ CT_BINUTILS_EXTRA_CONFIG_ARRAY=""
 Carsten>  CT_CC="gcc"
 Carsten>  CT_CC_VERSION="4.4.6"

It would also be nice to default to gcc 4.6.x to match the internal
toolchain.

-- 
Bye, Peter Korsgaard
