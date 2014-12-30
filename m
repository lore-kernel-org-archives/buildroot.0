From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Dec 2014 00:25:40 +0100
Subject: [Buildroot] [PATCH 0/3] oprofile: small set of fixes
In-Reply-To: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 29 Dec 2014 12:05:10 +0100")
References: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ppb0btzf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > Here is a small set of fixes/improvements to the oprofile package: fix
 > autobuilder issue appearing since the 1.0.0 bump, remove no longer
 > needed autoreconf, and a minor cleanup.

 > Thomas

 > Thomas Petazzoni (3):
 >   oprofile: fix nanosleep() issue on non-threaded toolchains
 >   oprofile: autoreconf is no longer needed
 >   oprofile: cleanup the style of the OPROFILE_BINARIES definition

Committed series, thanks.

-- 
Bye, Peter Korsgaard
