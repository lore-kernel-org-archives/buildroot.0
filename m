From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 11 Oct 2013 09:44:15 +0200
Subject: [Buildroot] [pull request v3] Pull request for branch
	yem/rpi-wayland
In-Reply-To: <cover.1381438785.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 10 Oct 2013 23:05:17 +0200")
References: <cover.1381438785.git.yann.morin.1998@free.fr>
Message-ID: <87fvs8uu9c.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Hello All!

 Yann> This series makes it possible to run weston on the raspberrypi.

 Yann> The series:
 Yann>   - bumps wayland and weston (patches 1 and 2)
 Yann>   - installs wayland-scanner to $(HOST) (patch 3)
 Yann>   - fixes weston configure.ac with patches from upstream (patches 4 and 5)
 Yann>   - modifies weston to build more than one compositor (patch 6)
 Yann>   - fixes rpi-userland (patch 7)
 Yann>   - actualy enables the rpi compoisotor in weston (path 8)

 Yann> Please pay special attention to commit logs of patches 4 and 7, they are
 Yann> tricky. I can add more details, or reworks them, if need be.

 Yann> Changes v2 -> v3:
 Yann>   - drop patch 9 due to it being dead code for now  (Thomas)
 Yann>   - fix weston build without EGL  (Peter)
 Yann>   - fix rpi-compositor missing dependency

Committed with the install -> $(INSTALL) fixup as discussed on IRC -
Thanks.

-- 
Bye, Peter Korsgaard
