From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 14 Apr 2010 09:56:49 +0200
Subject: [Buildroot] [PATCH 32/41] package: add libgnutls package
In-Reply-To: <1271199974-30434-33-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 14 Apr 2010 01:06:05 +0200")
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-33-git-send-email-llandwerlin@gmail.com>
Message-ID: <87vdbuh3ge.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

Hi,

 llandwerlin> +++ b/package/libgnutls/Config.in
 llandwerlin> @@ -0,0 +1,9 @@
 llandwerlin> +config BR2_PACKAGE_LIBGNUTLS
 llandwerlin> +	bool "libgnutls"
 llandwerlin> +        select BR2_PACKAGE_LIBGCRYPT
 llandwerlin> +	help
 llandwerlin> +          GNUTLS implements the TLS/SSL (Transport Layer Security aka
 llandwerlin> +          Secure Sockets Layer) protocol. Gnutls is a GNU project.
 llandwerlin> +          More up to date information can be found at
 llandwerlin> +
 llandwerlin> +          http://www.gnu.org/software/gnutls/

Indentation is also wrong here - The normal options are indented with a
<tab>, and the help text with <tab><space><space>.


-- 
Bye, Peter Korsgaard
