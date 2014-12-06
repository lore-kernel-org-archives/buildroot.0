From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Dec 2014 19:21:52 +0100
Subject: [Buildroot] [PATCH 2/3 v3] fs/ext2: use the new mke2img host
 package
In-Reply-To: <00d5e727f0799ef11b4fb935d8f80bb2206002fc.1417868913.git.yann.morin.1998@free.fr>
References: <cover.1417868913.git.yann.morin.1998@free.fr>
 <00d5e727f0799ef11b4fb935d8f80bb2206002fc.1417868913.git.yann.morin.1998@free.fr>
Message-ID: <20141206192152.6eca4567@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Dec 2014 13:29:45 +0100, Yann E. MORIN wrote:
> And get rid of the old genext2fs.sh wrapper.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Karoly Kasza <kaszak@gmail.com>
> Reviewed-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  fs/ext2/ext2.mk      |  13 +++---
>  fs/ext2/genext2fs.sh | 121 ---------------------------------------------------
>  2 files changed, 5 insertions(+), 129 deletions(-)
>  delete mode 100755 fs/ext2/genext2fs.sh

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 (on x86-64 in qemu, tested an ext4 filesystem with only the ext4
 kernel driver compiled in, and then tested an ext2 filesystem with
 only the ext2 kernel driver compiled in).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
