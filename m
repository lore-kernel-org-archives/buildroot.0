From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 22:16:06 +0100
Subject: [Buildroot] [PATCH 1 of 3] libpfm4: new package
In-Reply-To: <331f2a83706c939542f9.1363111854@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Tue, 12 Mar 2013 19:10:54 +0100")
References: <patchbomb.1363111853@BEANTN0L019720>
 <331f2a83706c939542f9.1363111854@BEANTN0L019720>
Message-ID: <8738vsz9wp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

 Thomas> +++ b/package/libpfm4/libpfm4.mk
 Thomas> @@ -0,0 +1,27 @@
 Thomas> +#############################################################
 Thomas> +#
 Thomas> +# libpfm4
 Thomas> +#
 Thomas> +#############################################################
 Thomas> +LIBPFM4_VERSION = 4.3.0
 Thomas> +LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 Thomas> +LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4

We normally have an empty line after the file header.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
