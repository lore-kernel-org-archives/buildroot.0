From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 10 Dec 2012 10:22:42 +0100
Subject: [Buildroot] [PATCH v2] libglib2: don't try to use
	DTrace/GCov/SystemTap for host build
In-Reply-To: <1355081107-27706-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 9 Dec 2012 20:25:07 +0100")
References: <1355081107-27706-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87mwxmtg65.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> We really only need the host build of libglib2 for a few helper
 Thomas> programs that are used for the target build of libglib2. Therefore,
 Thomas> trying to use bells and whistles like DTrace, GCov and SystemTap is
 Thomas> totally useless.

 Thomas> And it is actually harmful, since it is causing build failures on the
 Thomas> gcc110 PowerPC-based autobuilder that apparently has some
 Thomas> DTrace-feature installed. This commit therefore fixes:

Committed, thanks.

-- 
Bye, Peter Korsgaard
