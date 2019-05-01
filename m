From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 01 May 2019 09:04:32 +0200
Subject: [Buildroot] [PATCH] configs/qemu_xtensa_lx60_*: kernel build
 needs mkimage
In-Reply-To: <20190430203734.27376-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Tue, 30 Apr 2019 22:37:34 +0200")
References: <20190430203734.27376-1-yann.morin.1998@free.fr>
Message-ID: <877ebalkov.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Following ffbe46a5295 ("linux: simplify LINUX_BUILD_CMDS"), the Linux
 > kernel build for these xtensa qemu builds an image format that needs
 > mkimage.

 > Reported-by: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
 > Cc: Max Filippov <jcmvbkbc@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
