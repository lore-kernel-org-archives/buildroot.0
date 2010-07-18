From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 18 Jul 2010 22:43:35 +0200
Subject: [Buildroot] [PATCH 1/2] Match whole words when changing .config
	options
In-Reply-To: <1279484207-1692-1-git-send-email-m-starostik@versanet.de> (Malte
	Starostik's message of "Sun, 18 Jul 2010 22:16:46 +0200, Sun,
	18 Jul 2010 22:16:48 +0200")
References: <1279484207-1692-1-git-send-email-m-starostik@versanet.de>
Message-ID: <87aapowmfc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malte" == Malte Starostik <m-starostik@versanet.de> writes:

 Malte> Make KCONFIG_{ENABLE,DISABLE,SET}_OPT match whole words only.
 Malte> Fixes that BR_INET_IPV6 enables CONFIG_IPV6 in the kernel's
 Malte> .config, but also nukes everything with "CONFIG_IPV6" in its name, e.g.
 Malte> CONFIG_IPV6_PRIVACY.  This in turn causes any IPv6 options in a custom
 Malte> kernel .config to be lost and oldconfig going interactive.

Committed both, thanks.

In the future, don't forget to sign off on your patches (use -s).

-- 
Bye, Peter Korsgaard
