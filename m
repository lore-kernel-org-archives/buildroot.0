From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 15 Jan 2013 21:38:02 +0100
Subject: [Buildroot] [PATCH] opkg: fix configure step by adding
	host-pkgconf dependency
In-Reply-To: <1358267955-24060-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 15 Jan 2013 17:39:15 +0100")
References: <1358267955-24060-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fw22mbbp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> The opkg configure.ac uses the PKG_CHECK_MODULES() m4 macro, which is
 Thomas> provided by the .m4 files installed by host-pkgconf, so we must have
 Thomas> this package as a dependency.

 Thomas> Fixes:

 Thomas>   http://autobuild.buildroot.org/results/069fcab6e7dd5a1f07251ba6f52f65643a2f7594/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
