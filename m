From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 16:06:14 +0200
Subject: [Buildroot] [RFC 1/1] libupnp: add package libupnp
In-Reply-To: <1221656399-25047-1-git-send-email-hans-christian.egtvedt@atmel.com>
	(Hans-Christian Egtvedt's message of "Wed\,
	17 Sep 2008 14\:59\:59 +0200")
References: <1221656399-25047-1-git-send-email-hans-christian.egtvedt@atmel.com>
Message-ID: <873ajyzx2h.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Hans-Christian" == Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com> writes:

 Hans-Christian> This patch adds libupnp package to Buildroot. libupnp
 Hans-Christian> provides developers with an API that are compliant
 Hans-Christian> with version 1.0 of the Universal Plug and Play
 Hans-Christian> Device Architecture Specification.

Looks good.

 Hans-Christian> +LIBUPNP_INSTALL_STAGING:=YES
 Hans-Christian> +LIBUPNP_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR) install-strip

Not related to libupnp, but I think we should make install-strip the
default instead of install-exec - For what packages is install-exec
ever the right target?

-- 
Bye, Peter Korsgaard
