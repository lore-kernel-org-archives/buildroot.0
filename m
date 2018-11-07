From: Patrick Doyle <wpdster@gmail.com>
Date: Wed, 7 Nov 2018 13:57:29 -0500
Subject: [Buildroot] Weird OOM problem
In-Reply-To: <391130199.694669.1541614052863.JavaMail.zimbra@datacom.com.br>
References: <CAF_dkJDX+XuGWcxahLLr4wCAgg9r6PdUrUC-+oPEVuXgAPyMHQ@mail.gmail.com>
 <391130199.694669.1541614052863.JavaMail.zimbra@datacom.com.br>
Message-ID: <CAF_dkJAFuT+6N9iS71r_PToYUBG46PQUOq_Gkd0osOPiERy1RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Henrique,
On Wed, Nov 7, 2018 at 1:07 PM Henrique Marks
<henrique.marks@datacom.ind.br> wrote:
>
> Hi Patrick,

> Had some problems with this, it was caused by the use of a RAMDISK and a wrong parameter passed by uboot for the kernel.
>
> Can you post the line you use ?
>
# cat /proc/cmdline
console=ttyS0,115200 earlyprintk=serial,ttyS0,115200,keep ubi.mtd=1
ubi.fm_autoconvert=1 ubi.block=0,rootfs root=/dev/ubiblock0_rootfs
rootfstype=squashfs ro

--wpd
