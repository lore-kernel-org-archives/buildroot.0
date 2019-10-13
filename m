From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Oct 2019 15:42:23 +0200
Subject: [Buildroot] beaglebone_qt5 does not build since commit
 a7914499b80
In-Reply-To: <cbf93c1c-0a4a-79d4-6ebd-5d26f37d3c23@gmail.com>
References: <CAJ4jsae64FAUnKVqj2wEbYpEaLC31=gJuZuGCV3ZLjLbOP6djQ@mail.gmail.com>
 <cbf93c1c-0a4a-79d4-6ebd-5d26f37d3c23@gmail.com>
Message-ID: <20191013154223.60ede697@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Oct 2019 11:29:14 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> There is an old patch [2] [3] in patchwork bumping the kernel (to 4.9) used in
> this defconfig but it's marked "Changes Requested" due to issues.
> 
> If we really want to keep this defconfig (as is), we have to use an external
> toolchain old enough to build the kernel and TI's modules.

The right way to fix this defconfig is certainly not to use an older
toolchain, but rather to use a more modern kernel. It's BeagleBone,
definitely not a legacy/ancient platform, it's still in widespread use,
there is quite certainly a kernel + SGX OpenGL stuff that is reasonably
recent ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
