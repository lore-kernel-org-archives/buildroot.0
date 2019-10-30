From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Oct 2019 10:29:15 +0100
Subject: [Buildroot] [PATCH 1/3] package/gcc/9.2.0: backport or1k
 upstream patch
In-Reply-To: <20191019223107.1301848-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 20 Oct 2019 00:31:05 +0200")
References: <20191019223107.1301848-1-romain.naour@gmail.com>
Message-ID: <87r22u37kk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Without this patch, the system build using qemu_or1k_defconfig
 > (gcc 9.2, binutils 2.33.1 and uClibc 1.0.32) doesn't boot.

 > https://mailman.uclibc-ng.org/pipermail/devel/2019-August/001895.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>

Committed to 2019.08.x, thanks. (2019.02.x does not have gcc 9.2)

-- 
Bye, Peter Korsgaard
