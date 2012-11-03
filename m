From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 03 Nov 2012 17:54:52 +0100
Subject: [Buildroot] [PATCH] gdb: adjust behavior when thread debug is
	not available
In-Reply-To: <1338655156-4133-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Jun 2012 18:39:16 +0200")
References: <1338655156-4133-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lieiy6cj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When an external toolchain without thread debug is used, the gdb
 Thomas> package can be selected, but no version can be choosen, since none
 Thomas> match any of the requirements. This leads Buildroot to try to build
 Thomas> gdb for the target without a version being defined, as in the
 Thomas> following build log:

 Thomas>  http://autobuild.buildroot.org/results/84e8fd2df0cc22448052a572c2e9a6e03dd137eb/build-end.log

Committed, thanks.

-- 
Bye, Peter Korsgaard
