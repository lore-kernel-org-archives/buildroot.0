From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Oct 2017 16:36:30 +0200
Subject: [Buildroot] [PATCH v2 2/3] board/pc: add documentation for
 testing with qemu
In-Reply-To: <20171022135426.28901-2-nunes.erico@gmail.com>
References: <20171022135426.28901-1-nunes.erico@gmail.com>
 <20171022135426.28901-2-nunes.erico@gmail.com>
Message-ID: <20171022163630.383b54f4@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 Oct 2017 15:54:25 +0200, Erico Nunes wrote:

> +qemu-system-x86_64 \
> +	-M pc \
> +	-bios </path/to/OVMF_CODE.fd> \
> +	-drive file=output/images/disk.img,if=virtio,format=raw \
> +	-net nic,model=virtio \
> +	-net user
> +
> +Note that </path/to/QEMU_EFI.fd> needs to point to a valid x86_64 UEFI

You meant OVMF_CODE.fd here, so I've fixed that up and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
