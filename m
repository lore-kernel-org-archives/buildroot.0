From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Mar 2018 09:27:05 +0200
Subject: [Buildroot] [PATCH 1/2] package/jimtcl: fix fallout after
 no-C++ fixups
In-Reply-To: <386fedf0af053ab538b5b4d805a007c6349154d5.1522480811.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 31 Mar 2018 09:20:19 +0200")
References: <cover.1522480811.git.yann.morin.1998@free.fr>
 <386fedf0af053ab538b5b4d805a007c6349154d5.1522480811.git.yann.morin.1998@free.fr>
Message-ID: <87r2o0vh6e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
 > non-existent 'no' binary when C++ is not available in the toolchain.

 > However, some packages, like jimtcl, really want to find the binary that
 > $CXX contains.

 > Revert jimtcl to use 'false' instead of 'no'.

 > Fixes:
 >     http://autobuild.buildroot.org/results/54f/54f3df03551fbdf293d33dc1e3f08005faa15321/

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
