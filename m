From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 23:20:09 +0200
Subject: [Buildroot] [PATCH 2/4] package/freerdp: can not build on uClibc
In-Reply-To: <62743afc9fb2eb079bd1a3ff32ebfbf911fd1e16.1411921550.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 28 Sep 2014 18:26:28 +0200")
References: <cover.1411921550.git.yann.morin.1998@free.fr>
 <62743afc9fb2eb079bd1a3ff32ebfbf911fd1e16.1411921550.git.yann.morin.1998@free.fr>
Message-ID: <87lhp3sara.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > FreeRDP uses eventfd_{read,write}, which is not supported in uClibc.
 > Fixes:
 >     http://autobuild.buildroot.net/results/ad7/ad7ade4c436d21cba930f40c613870fbadec840e/
 >     http://autobuild.buildroot.net/results/5a3/5a30aecbb426f76a22e8285931a0a8cd59b5e70b/
 >     http://autobuild.buildroot.net/results/6e0/6e0de0538e95ae156f7d2ad6eede46e44be81c8e/
 >     [...]

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 > ---
 > Note: although we depend on !uClibc, we still comment about glibc or
 > musl, because we currently do not have a documented way for negative
 > dependencies.

Committed, thanks.

-- 
Bye, Peter Korsgaard
