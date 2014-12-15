From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Dec 2014 22:17:55 +0100
Subject: [Buildroot] [PATCH 5/5] pckage/ncurses: fix pkg-config files
	for ncursesw
In-Reply-To: <50b4b144f7de56b1d0a60ec133c6fbf89c265dc3.1418572993.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sun, 14 Dec 2014 17:04:40 +0100")
References: <cover.1418572993.git.yann.morin.1998@free.fr>
 <50b4b144f7de56b1d0a60ec133c6fbf89c265dc3.1418572993.git.yann.morin.1998@free.fr>
Message-ID: <874mswliik.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Currently, ncurses creates symlinks from the non-'w' variants to the
 > equivalent 'w' variant, but forgets to do so for pkg-config files.

 > Do that for the pkg-config files too.

 > Should fix numerous autobuild failures:
 >     http://autobuild.buildroot.net/results/3c4/3c44dfc6e3f151bef751f39cac336fef3d6a0099/
 >     http://autobuild.buildroot.net/results/38c/38c81407bb8d0677e87b3a01f9a1fc1372ab4738/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
