From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Oct 2013 12:54:53 +0200
Subject: [Buildroot] [PATCH 3/4] Makefile: export BUILD_DIR
In-Reply-To: <834cf660ddc6216e486f97195f464f0e6125774e.1381705600.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 14 Oct 2013 01:11:27 +0200")
References: <cover.1381705600.git.yann.morin.1998@free.fr>
 <cover.1381705600.git.yann.morin.1998@free.fr>
 <834cf660ddc6216e486f97195f464f0e6125774e.1381705600.git.yann.morin.1998@free.fr>
Message-ID: <87y55wruki.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> $(BUILD_DIR) is a nice place to put files generated during the build.
 Yann> With the advent of user-supplied step-hooks, they may want to store
 Yann> some information on the build.

 Yann> Export BUILD_DIR to that effect.

Looks good, but please also update the documentation in
docs/manual/customize-rootfs.txt.

-- 
Bye, Peter Korsgaard
