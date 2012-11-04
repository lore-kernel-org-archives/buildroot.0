From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 04 Nov 2012 11:53:01 +0100
Subject: [Buildroot] [PATCH 11/12] ulogd: add new package
In-Reply-To: <1350909989-1012-11-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 22 Oct 2012 09:46:28 -0300")
References: <1350909989-1012-1-git-send-email-gustavo@zacarias.com.ar>
 <1350909989-1012-11-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bofdtzaq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo> @@ -0,0 +1,17 @@
 Gustavo> +#############################################################
 Gustavo> +#
 Gustavo> +# ulogd
 Gustavo> +#
 Gustavo> +#############################################################
 Gustavo> +
 Gustavo> +ULOGD_VERSION = 2.0.1
 Gustavo> +ULOGD_SOURCE = ulogd-$(ULOGD_VERSION).tar.bz2
 Gustavo> +ULOGD_SITE = http://www.netfilter.org/projects/ulogd/files
 Gustavo> +ULOGD_AUTORECONF = YES
 Gustavo> +ULOGD_DEPENDENCIES = host-pkg-config \
 Gustavo> +	libmnl libnetfilter_acct libnetfilter_conntrack libnetfilter_log \
 Gustavo> +	libnfnetlink
 Gustavo> +ULOGD_LICENSE = GPLv2
 Gustavo> +ULOGD_LICENSE_FILES = COPYING

I seems to try to build a postgresql backend on the autobuilder, perhaps
you're missing a configure option?

http://autobuild.buildroot.net/results/1dcf63799937f2216e3c712af8880ad431dbd47c/build-end.log

-- 
Bye, Peter Korsgaard
