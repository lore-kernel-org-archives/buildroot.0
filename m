From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 11 Jul 2016 22:57:08 +0200
Subject: [Buildroot] [PATCH] package/e2fsprogs: fix 0002 patch
In-Reply-To: <1468159619-26689-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 10 Jul 2016 16:06:59 +0200")
References: <1468159619-26689-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87oa6399ln.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Patch 0002-fuse2fs-might-need-librt.patch introduced a new configure.ac
 > variable that should contain whether -lrt is needed to gt clock_gettime.

 > However, it forgot to propagate that variable into the Makefiles.

 > Because e2fprogs is not using automake (just autoconf), the configure
 > variables are not automatically propagated; it needs to be done
 > manually.

 > Fixes:
 >     http://autobuild.buildroot.org/results/edf/edf4195d33720d51031a84c3bdb6b6b0ed3b4731/
 >     http://autobuild.buildroot.org/results/987/987efb687870062c509361eaefd0ff80043392f8/
 >     http://autobuild.buildroot.org/results/f58/f58b5f8f5cd069b63aae4249bc7aefb145789b7d/
 >     [...]

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

-- 
Bye, Peter Korsgaard
