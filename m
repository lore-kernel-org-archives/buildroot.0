From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 03 Jul 2013 22:12:03 +0200
Subject: [Buildroot] [PATCH 07/23] elf2flt: convert to the package
	infrastructure
In-Reply-To: <1372620553-11416-8-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:28:57 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zju3pfn0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> +++ b/Config.in.legacy
 Thomas> @@ -86,6 +86,13 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
 Thomas>  #
 Thomas>  # Legacy options since 2013.02
 Thomas>  #
 Thomas> +config BR2_ELF2FLT
 Thomas> +	bool "the elf2flt option has been renamed"
 Thomas> +	select BR2_LEGACY
 Thomas> +	help
 Thomas> +	  The BR2_ELF2FLT option has been renamed to
 Thomas> +	  BR2_PACKAGE_HOST_ELF2FLT due to the conversion of elf2flt to
 Thomas> +	  the package infrastructure.

This should go together with the other 2013.08 options.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
