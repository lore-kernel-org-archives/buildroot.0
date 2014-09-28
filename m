From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 22:18:08 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/wayland: requires shared
	library
In-Reply-To: <1411894094-30925-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sun, 28 Sep 2014 10:48:14 +0200")
References: <1411894094-30925-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87h9zrts73.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Fixes
 >   CC       src/libwayland_server_la-wayland-server.lo
 > src/wayland-server.c:36:19: error: dlfcn.h: No such file or directory

 > using this defconfig
 > http://autobuild.buildroot.net/results/dfd/dfd81f1f1f0f315317b2a85d24b286a277ac7c16/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v3: update comments (Yann)
 > v2: propagate this new dependency to packages that select wayland (Yann)

Committed, thanks.

-- 
Bye, Peter Korsgaard
