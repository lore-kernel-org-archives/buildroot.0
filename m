From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 Jul 2009 08:45:15 +0200
Subject: [Buildroot] [PATCH] [LINUX 2/2] Update kernel "latest"
	major/minor version numbers
In-Reply-To: <4A69DF01.40708@atmel.com> (Ulf Samuelsson's message of "Fri\,
	24 Jul 2009 18\:19\:13 +0200")
References: <4A69DF01.40708@atmel.com>
Message-ID: <87eis59s78.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 >> From 1a6f22d2a3616e649c8241a3efc5b09aaa0fb849 Mon Sep 17 00:00:00 2001
 Ulf> From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
 Ulf> Date: Fri, 24 Jul 2009 18:04:06 +0200
 Ulf> Subject: [PATCH] Update kernel "latest" major/minor version numbers
 Ulf>  including adding support for 2.6.30/2.6.31-rc#

 Ulf> ---
 Ulf>  target/linux/Config.in.advanced |   21 +++++++++++++++++----
 Ulf>  target/linux/Config.in.versions |   16 ++++++++++------
 Ulf>  2 files changed, 27 insertions(+), 10 deletions(-)

I really think the Kconfig stuff for linux-advanced is way too verbose
- 27 lines to add 2 new kernel versions seems excessive.

-- 
Bye, Peter Korsgaard
