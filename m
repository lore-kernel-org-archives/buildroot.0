From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jun 2012 01:52:03 +0200
Subject: [Buildroot] [PATCH] quota: new package (v8)
In-Reply-To: <1338637230-6694-1-git-send-email-jarkko.sakkinen@intel.com>
 (Jarkko Sakkinen's message of "Sat, 2 Jun 2012 14:40:30 +0300")
References: <1338637230-6694-1-git-send-email-jarkko.sakkinen@intel.com>
Message-ID: <87zk7ta8nw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jarkko" == Jarkko Sakkinen <jarkko.sakkinen@intel.com> writes:

 Jarkko> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@intel.com>

Committed with minor change, thanks.

 Jarkko> +config BR2_PACKAGE_QUOTA
 Jarkko> +	bool "quota"
 Jarkko> +	depends on BR2_INET_RPC
 Jarkko> +	depends on BR2_LARGEFILE
 Jarkko> +	depends on BR2_USE_WCHAR
 Jarkko> +	select BR2_PACKAGE_UTIL_LINUX
 Jarkko> +	select BR2_PACKAGE_UTIL_LINUX_MOUNT
 Jarkko> +	help
 Jarkko> +	  Implementation of the disk quota system.
 Jarkko> +	  http://sourceforge.net/projects/linuxquota/

We normally have an empty line before the URL, so I've changed that.

-- 
Bye, Peter Korsgaard
