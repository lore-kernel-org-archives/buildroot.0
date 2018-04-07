From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Apr 2018 19:49:26 +0200
Subject: [Buildroot] [git commit] package/openocd: fix fallout after
 no-C++ fixups
In-Reply-To: <20180331072728.BFB9683F19@busybox.osuosl.org> (Peter Korsgaard's
 message of "Sat, 31 Mar 2018 09:26:19 +0200")
References: <20180331072728.BFB9683F19@busybox.osuosl.org>
Message-ID: <87fu46ewk9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5966e2dc54dfb19c5fde3a09d72f3abc6125c202
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
 > non-existent 'no' binary when C++ is not available in the toolchain.

 > However, some packages, like jimtcl as bundled in opeocd, really want to
 > find the binary that $CXX contains.

 > Revert openocd to use 'false' instead of 'no'.

 > Fixes:
 >     http://autobuild.buildroot.org/results/cbd/cbd5ab97fb0659968ff628461130627cf1745955/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
