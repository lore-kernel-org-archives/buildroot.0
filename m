From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Sep 2009 16:52:49 +0200
Subject: [Buildroot] [PATCH] libarchive package added
In-Reply-To: <1251209096-31922-1-git-send-email-daniel@caiaq.de> (Daniel
	Mack's message of "Tue\, 25 Aug 2009 16\:04\:56 +0200")
References: <1251209096-31922-1-git-send-email-daniel@caiaq.de>
Message-ID: <87skf6pvi6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

Hi,

 Daniel> +++ b/package/libarchive/Config.in
 Daniel> @@ -0,0 +1,15 @@
 Daniel> +config BR2_PACKAGE_LIBARCHIVE
 Daniel> +	bool "libarchive"
 Daniel> +	help
 Daniel> +	  Libarchive is a reusable C library for reading and writing a
 Daniel> +	  variety of streaming archive formats.
 Daniel> +
 Daniel> +	  http://code.google.com/p/libarchive/
 Daniel> +
 Daniel> +config BR2_LIBARCHIVE_INSTALL_TO_TARGET
 Daniel> +	bool "install libarchive to target"
 Daniel> +	depends on BR2_PACKAGE_LIBARCHIVE
 Daniel> +	default y
 Daniel> +	help
 Daniel> +	  Say Y here to make BR2 copy the libarchive files to the target
 Daniel> +	  destination folder.

When would you not want to do this?

-- 
Bye, Peter Korsgaard
