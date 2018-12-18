From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 18 Dec 2018 15:28:06 +0100
Subject: [Buildroot] [PATCH] swupdate: ensure TARGET_CC is used for
 compiling/linking
In-Reply-To: <20181218091106.18688-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 18 Dec 2018 10:11:06 +0100")
References: <20181218091106.18688-1-peter@korsgaard.com>
Message-ID: <87imzq29l5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 >     http://autobuild.buildroot.net/results/e302d0edb59ff7617b5f2d21f06eb65ae04981fe
 >     http://autobuild.buildroot.net/results/dbb69acadc20b4bb559311348eca276c1e6343f7

 > Swupdate uses $CROSS-cc instead of $CROSS-gcc, which is not available in all
 > external toolchains, and use CC for linking. Ensure TARGET_CC is used for both.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed to 2018.02.x, 2018.08.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
