From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 14 Apr 2014 22:14:09 +0200
Subject: [Buildroot] Asking a favor
In-Reply-To: <182de9096cb1b88ec1e69efd698351b5@paravisioner.com>
References: <ea83c79e30b1bba43b6fe3de6096e8e7@paravisioner.com>
 <20140413212851.GA6582@free.fr> <20140414091249.09b2db65@skate>
 <db58e085aec8b3d6153effbff253e376@paravisioner.com>
 <20140414181812.21e12b0c@skate>
 <182de9096cb1b88ec1e69efd698351b5@paravisioner.com>
Message-ID: <286d8cd8-bdca-4b35-a113-ce565161b784@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Parsa Panahi,

(Please don't top-post, put your reply below the original mail...)


Parsa Panahi <panahi.parsa@paravisioner.com> schreef:
> 
>
>Dear Thomas, I've Selected the "Use a device tree present in the kernel"
>in the "Kernel -> Device tree support" and I don't know why it shows 
>
>BR2_LINUX_KERNEL_INTREE_DTS_NAME="" !!!
>
>what are my options in here so I could manually type it in the .config
>file ?

Which board are you targeting? Is this a standard development or reference board, or a custom design?

A device tree is a description of the hardware. If you are using a common board, you may find the right device tree source in directory arch/<arch>/boot/dts of the kernel sources. If you are using a custom board, you will have to create the device tree yourself.

Best regards,
Thomas
