From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 08 Nov 2012 00:09:17 +0100
Subject: [Buildroot] [PATCH 2/2] Add python3 package
In-Reply-To: <1352300481-825-3-git-send-email-maxime.ripard@free-electrons.com>
 (Maxime Ripard's message of "Wed, 7 Nov 2012 16:01:21 +0100")
References: <1352300481-825-1-git-send-email-maxime.ripard@free-electrons.com>
 <1352300481-825-3-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <87vcdh9fj6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Ripard <maxime.ripard@free-electrons.com> writes:

 Maxime> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

 Maxime> +comment "python requires a toolchain with WCHAR support"

s/python/python3/

 Maxime> +#
 Maxime> +# Development files removal
 Maxime> +#
 Maxime> +define PYTHON3_REMOVE_DEVFILES
 Maxime> +	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 Maxime> +	rm -f $(TARGET_DIR)/usr/bin/python-config

As far as I can see it doesn't install python-config.

Committed with these minor fixes, thanks!

-- 
Bye, Peter Korsgaard
