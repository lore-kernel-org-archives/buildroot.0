From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Oct 2008 10:38:13 +0100
Subject: [Buildroot] [PATCH] qtopia4: fix use of pkg-config
In-Reply-To: <200810280251.36628.markus.heidelberg@web.de> (Markus
	Heidelberg's message of "Tue\, 28 Oct 2008 02\:51\:36 +0100")
References: <200810280251.36628.markus.heidelberg@web.de>
Message-ID: <87ej21cb5m.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:

 Markus> When cross compiling, Qt sets PKG_CONFIG in its own configure script to
 Markus> an empty string. That leads to not using pkg-config. To avoid that, use
 Markus> the configure option -force-pkg-config. Also set environment variables
 Markus> for pkg-config defined in TARGET_CONFIGURE_OPTS.

Thanks, committed.

-- 
Bye, Peter Korsgaard
