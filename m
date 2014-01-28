From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Jan 2014 23:55:09 +0100
Subject: [Buildroot] [PATCH 1/3] package/rpi-userland: fix fall-out
	after cmake infra change
In-Reply-To: <f1e089f08a99fa89b5c7facdc5fc320f1e6c4cb4.1390593263.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Fri, 24 Jan 2014 20:56:21 +0100")
References: <cover.1390593263.git.yann.morin.1998@free.fr>
 <f1e089f08a99fa89b5c7facdc5fc320f1e6c4cb4.1390593263.git.yann.morin.1998@free.fr>
Message-ID: <87vbx3yawi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cset 9fa7f2b (pkg-cmake.mk: build shared library when !BR2_PREFER_STATIC_LIB)
 > broke rpi-userland.

 > Force not building shared libs for rpi-userland, since they are broken.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
