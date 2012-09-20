From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Sep 2012 14:13:59 +0200
Subject: [Buildroot] [PATCH] use a more portable syntax for mktemp.
	fixes build problem under MacOS X
In-Reply-To: <20120919223028.168abba2@skate> (Thomas Petazzoni's message of
 "Wed, 19 Sep 2012 22:30:28 +0200")
References: <20120919164317.GA20160@waldemar-brodkorb.de>
 <20120919223028.168abba2@skate>
Message-ID: <874nmsao3c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> # Check if we can link to ncurses

 Thomas> If you make any changes to support/kconfig/, then those changes
 Thomas> should also be done in the patches in support/kconfig/patches/
 Thomas> that help us port our changes to later versions of kconfig when
 Thomas> we sync kconfig with the latest kernel version.

Or Yann's new kconfig-frontends package.

 Thomas> In your case, changing patch 11 sounds like a good plan. However, does
 Thomas> Buildroot really works on Mac OS X? I don't think anybody uses
 Thomas> Buildroot on Mac OS X, and I suspect that a lot of things might be
 Thomas> broken besides just kconfig, no?

My thoughts exactly.

-- 
Bye, Peter Korsgaard
