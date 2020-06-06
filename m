From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 6 Jun 2020 23:49:12 +0200
Subject: [Buildroot] [PATCH, for-next] package/rust: remove unneded patch
In-Reply-To: <20200530134344.24976-1-romain.naour@gmail.com>
References: <20200530134344.24976-1-romain.naour@gmail.com>
Message-ID: <20200606234912.6acabde1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 May 2020 15:43:44 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> The previous commit [1] added a patch to remove python2 from the configure script.
> While this script is used by the Fedora rust package [2], it is not used by rust.mk.
> 
> The configure script is an alternative build system provided by upstream, and
> finally calls x.py [3].
> 
> Thanks to Thomas for noticing the mistake [4].
> 
> [1] 02703108eca8353ff45c0842d9b882a0dc37c04b
> [2] https://src.fedoraproject.org/rpms/rust/blob/216b2d27716bf1031c526dbd0e01a1fa8e6d5aa2/f/rust.spec#_314
> [3] https://github.com/rust-lang/rust/blob/1.33.0/README.md#configure-and-make
> [4] http://lists.busybox.net/pipermail/buildroot/2020-May/283610.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Titouan Christophe <titouan.christophe@railnova.eu>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...igure-use-default-python-interpreter.patch | 37 -------------------
>  1 file changed, 37 deletions(-)
>  delete mode 100644 package/rust/0002-configure-use-default-python-interpreter.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
