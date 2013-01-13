From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 21:24:51 +0100
Subject: [Buildroot] [PATCH 1/3] libmhash: new package
In-Reply-To: <1357582380-22332-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 7 Jan 2013 15:12:58 -0300")
References: <1357582380-22332-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87pq18x23w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/Config.in            |    1 +
 Gustavo>  package/libmhash/Config.in   |    9 +++++++++
 Gustavo>  package/libmhash/libmhash.mk |   14 ++++++++++++++
 Gustavo>  3 files changed, 24 insertions(+), 0 deletions(-)
 Gustavo>  create mode 100644 package/libmhash/Config.in
 Gustavo>  create mode 100644 package/libmhash/libmhash.mk

 Gustavo> diff --git a/package/Config.in b/package/Config.in
 Gustavo> index 0f397d6..942e62c 100644
 Gustavo> --- a/package/Config.in
 Gustavo> +++ b/package/Config.in
 Gustavo> @@ -370,6 +370,7 @@ source "package/beecrypt/Config.in"
 Gustavo>  source "package/gnutls/Config.in"
 Gustavo>  source "package/libgcrypt/Config.in"
 Gustavo>  source "package/libgpg-error/Config.in"
 Gustavo> +source "package/libmhash/Config.in"
 Gustavo>  source "package/libnss/Config.in"
 Gustavo>  source "package/nettle/Config.in"
 Gustavo>  source "package/ocf-linux/Config.in"
 Gustavo> diff --git a/package/libmhash/Config.in b/package/libmhash/Config.in
 Gustavo> new file mode 100644
 Gustavo> index 0000000..82b544f
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/libmhash/Config.in
 Gustavo> @@ -0,0 +1,9 @@
 Gustavo> +config BR2_PACKAGE_LIBMHASH
 Gustavo> +	bool "libmhash"
 Gustavo> +	help
 Gustavo> +	  Mhash is a free (under GNU Lesser GPL) library which provides
 Gustavo> +	  a uniform interface to a large number of hash algorithms.
 Gustavo> +	  These algorithms can be used to compute checksums, message digests,
 Gustavo> +	  and other signatures. 

Trailing space. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
