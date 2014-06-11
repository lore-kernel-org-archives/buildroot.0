From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Jun 2014 23:03:55 +0200
Subject: [Buildroot] [PATCH] hdparm: prevent package makefile from
	stripping the hdparm binary
In-Reply-To: <1402519589-29908-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 11 Jun 2014 22:46:29 +0200")
References: <1402519589-29908-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87tx7rf9ac.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Packages shouldn't strip executables by themselves, so that Buildroot
 > controls whether stripping should occur or not. This also fixes the
 > build on Blackfin FLAT where stripping actually doesn't work because
 > stripping FLAT binaries is not supported.

 > Fixes:

 >   http://autobuild.buildroot.org/results/7d4/7d4e59c96928a06db5091235bf2eacf462ba8a21/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
