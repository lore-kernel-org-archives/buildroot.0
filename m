From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 09:27:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/openocd: fix fallout after
 no-C++ fixups
In-Reply-To: <8162669309357bfbd684960e225b215ccd2abec1.1522480811.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 31 Mar 2018 09:20:20 +0200")
References: <cover.1522480811.git.yann.morin.1998@free.fr>
 <8162669309357bfbd684960e225b215ccd2abec1.1522480811.git.yann.morin.1998@free.fr>
Message-ID: <87muyovh64.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
 > non-existent 'no' binary when C++ is not available in the toolchain.

 > However, some packages, like jimtcl as bundled in opeocd, really want to
 > find the binary that $CXX contains.

 > Revert openocd to use 'false' instead of 'no'.

 > Fixes:
 >     http://autobuild.buildroot.org/results/cbd/cbd5ab97fb0659968ff628461130627cf1745955/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
