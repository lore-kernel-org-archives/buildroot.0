From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 19:49:09 +0200
Subject: [Buildroot] [git commit] package/jimtcl: fix fallout after
 no-C++ fixups
In-Reply-To: <20180331072728.A219883F19@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 31 Mar 2018 09:25:51 +0200")
References: <20180331072728.A219883F19@busybox.osuosl.org>
Message-ID: <87k1tiewkq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=9feb6d982d7a5e3b61cc19ad9733dd3e737bf6a0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
 > non-existent 'no' binary when C++ is not available in the toolchain.

 > However, some packages, like jimtcl, really want to find the binary that
 > $CXX contains.

 > Revert jimtcl to use 'false' instead of 'no'.

 > Fixes:
 >     http://autobuild.buildroot.org/results/54f/54f3df03551fbdf293d33dc1e3f08005faa15321/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
