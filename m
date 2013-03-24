From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 13:51:50 +0100
Subject: [Buildroot] [PATCH 17/22] dependencies: remove a few useless
	mandatory dependencies
In-Reply-To: <1364113606-20836-18-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 24 Mar 2013 09:26:41 +0100")
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1364113606-20836-18-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87sj3lkljt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> awk, bison, flex, makeinfo, gettext should be built as dependencies of
 Thomas> packages when needed. In practice, even the toolchain build doesn't
 Thomas> need any of these, and only a few packages do require them.

 Thomas> It is not needed to list gzip and bzip2 since they are already checked
 Thomas> through ${DL_TOOLS}: whenever a package needs gzip or bzip2 for its
 Thomas> extraction, the dependency is added.

Committed, thanks.

-- 
Bye, Peter Korsgaard
