From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:07:19 +0200
Subject: [Buildroot] [PATCHv2 05/14] gcc: fix Objective-C support
In-Reply-To: <1378138000-12739-6-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:31 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87a9jdkd4o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit fixes the Objective-C support in the gcc package by making
 Thomas> sure that the runtime Objective-C library is properly installed to the
 Thomas> target.

 Thomas> It also takes this opportunity to slightly reword the Config.in option
 Thomas> help text to have a more meaningful explanation.

 Thomas> Finally, it fixes the gcc-final.mk code to use the correct
 Thomas> BR2_INSTALL_OBJC option rather than the non-existing
 Thomas> BR2_GCC_CROSS_OBJC option, to decide whether Objective-C support
 Thomas> should be enabled or not in the cross-compiler.

Committed, thanks.

-- 
Bye, Peter Korsgaard
