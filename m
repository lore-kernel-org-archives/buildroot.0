From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Sep 2014 00:38:43 +0200
Subject: [Buildroot] [PATCH v2 2/2] Revert "package/localedef: don't use
	config.site when cross-compiling"
In-Reply-To: <1408698774-13615-2-git-send-email-romain.naour@openwide.fr>
 (Romain Naour's message of "Fri, 22 Aug 2014 11:12:54 +0200")
References: <1408698774-13615-1-git-send-email-romain.naour@openwide.fr>
 <1408698774-13615-2-git-send-email-romain.naour@openwide.fr>
Message-ID: <87ppex3k0c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@openwide.fr> writes:

 > CONFIG_SITE is now a part of pkg-autotools infrastructure.
 > This reverts commit 85448febb3c9f21e6e4082fc344b3ef46261c782.

 > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 > ---
 > v2: commit log: add missing Sob

Committed, thanks.

-- 
Bye, Peter Korsgaard
