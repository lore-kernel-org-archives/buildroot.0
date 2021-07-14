From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jul 2021 22:09:20 +0200
Subject: [Buildroot] [git commit] package/e2fsprogs: fix fsck overwrite
 in HOST_DIR
In-Reply-To: <20210706204015.033CD95463@busybox.osuosl.org> (Yann E. MORIN's
 message of "Tue, 6 Jul 2021 22:44:34 +0200")
References: <20210706204015.033CD95463@busybox.osuosl.org>
Message-ID: <87czrkverz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=7b7c8cc67280c3ee8ec79d4e381519b18386bd8c
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > host-e2fsprogs package overwrites the fsck program and some
 > manpages previously installed by host-util-linux package.

 > This patch simply disables fsck in host-e2fsprogs.

 > host-e2fsprogs is used to build final ext{2,3,4} images.
 > The missing host-e2fsprogs fsck tool (filesystem integrity check
 > tool) in HOST_DIR should not lead to issues.

 > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
 > Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
