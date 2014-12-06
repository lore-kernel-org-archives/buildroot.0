From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Dec 2014 19:23:25 +0100
Subject: [Buildroot] [PATCH 3/3 v3] fs/ext2: add option to specify a
 filesystem label
In-Reply-To: <0244e2c2f1c3933e110df8478544efafe66c7e5c.1417868913.git.yann.morin.1998@free.fr>
References: <cover.1417868913.git.yann.morin.1998@free.fr>
 <0244e2c2f1c3933e110df8478544efafe66c7e5c.1417868913.git.yann.morin.1998@free.fr>
Message-ID: <20141206192325.5cb5da30@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat,  6 Dec 2014 13:29:46 +0100, Yann E. MORIN wrote:
> Filesystems of the ext familly can carry a filesystem label.
> Add an option for the user to specify such a label.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: K?roly Kasza <kaszak@gmail.com>

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
