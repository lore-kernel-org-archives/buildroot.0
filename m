From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 20 Jan 2014 22:37:39 +0100
Subject: [Buildroot] [PATCH v2 1/3] uclibc: bump xtensa snapshot version
In-Reply-To: <2cb50cbfb9dff5627aecbebc8cd4d1bd76c505f1.1389594195.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Mon, 13 Jan 2014 08:26:12 +0200")
References: <cover.1389594195.git.baruch@tkos.co.il>
 <2cb50cbfb9dff5627aecbebc8cd4d1bd76c505f1.1389594195.git.baruch@tkos.co.il>
Message-ID: <87a9eqjpwc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > This new version includes two xtensa fixes:
 > 00571b43df2e libc: posix_fadvise: restore implementation for xtensa
 > de6561f66693 xtensa: use common ptrace.h

 > The first fixes (correctly)
 > http://autobuild.buildroot.net/results/ab1/ab1250c3d402ec3fbaf22eeffd07de218ffafb22/.

 > The second fixes
 > http://autobuild.buildroot.net/results/84f/84fb918efbcbf1312a228a9c11608edf096b3c40/.

 > The unifdef regression (the original motivation for the fixed xtensa snapshot
 > version introduced in commit cecaf09cd6) should now be fixed.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed, thanks.

-- 
Bye, Peter Korsgaard
