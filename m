From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 Feb 2017 22:14:15 +0100
Subject: [Buildroot] [PATCH] cbootimage: disable on musl
In-Reply-To: <1487104498-30443-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 14 Feb 2017 21:34:58 +0100")
References: <1487104498-30443-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87efz0iifs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > cbootimage uses non-standard u_intXX_t types instead of the C99 types
 > uintXX_t types, which prevents it from building with the musl C library.

 > A patch to fix this has been submitted upstream, but since there are
 > many many occurences of such types, the patch is a bit large to carry in
 > Buildroot, especially compared to the fact that having this package
 > building against musl is probably not a top priority.

 > So for now, simply disable this package on musl, until upstream fixes
 > the issue and releases a new version.

 > Fixes:

 >   http://autobuild.buildroot.net/results/61bdfb7e0ff9628190d9eb86e40c4c90e768b8e2

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
