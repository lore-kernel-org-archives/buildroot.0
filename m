From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Jun 2013 23:09:26 +0200
Subject: [Buildroot] [PATCH 3/6] package/genext2fs: add host variant
In-Reply-To: <eb1ddff01f34cffea3d4556f414dda0f346ec703.1370289131.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 3 Jun 2013 22:15:49 +0200")
References: <cover.1370289131.git.yann.morin.1998@free.fr>
 <cover.1370289131.git.yann.morin.1998@free.fr>
 <eb1ddff01f34cffea3d4556f414dda0f346ec703.1370289131.git.yann.morin.1998@free.fr>
Message-ID: <87a9n6hpfd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> genext2fs is built only if the user selected an ext2 root filesystem.

 Yann> However, some use-cases can't live with the full target/ dir on the
 Yann> root filesystem, and requires separate partitions (eg. for /usr).
 Yann> In this case, the user would not select an ext2 root fs in the
 Yann> Buildrooot menu, and would only generate a tarball of the rootfs.
 Yann> This tarball would then be used from a post-image script to build
 Yann> the actual required FSes.

 Yann> But then, genext2fs is not built, since the ext2 root FS was not
 Yann> selected.

 Yann> As for the other filesystem generators, provide a host variant of
 Yann> genext2fs (genext2fs is already host-package aware, so only needs
 Yann> adding a Kconfig entry).

Committed, thanks.

-- 
Bye, Peter Korsgaard
