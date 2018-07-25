From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 25 Jul 2018 22:53:19 +0200
Subject: [Buildroot] [PATCH] package/binutils: fix xtensa linker
 relaxation regression in 2.31.1
In-Reply-To: <20180723193753.15922-1-jcmvbkbc@gmail.com>
References: <20180723193753.15922-1-jcmvbkbc@gmail.com>
Message-ID: <e7652297-904c-5847-5ce8-8bfb730f7ef4@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

Le 23/07/2018 ? 21:37, Max Filippov a ?crit?:
> Fix the following xtensa ld error observed when building uClibc-ng
> libthread_db with binutils-2.31:
> 
>   BFD (GNU Binutils) 2.31 internal error, aborting at
>   elf32-xtensa.c:3269 in elf_xtensa_finish_dynamic_sections
> 
> Fixes: https://gitlab.com/free-electrons/toolchains-builder/-/jobs/82264912
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Thanks for the patch :)

Tested-by: Romain Naour <romain.naour@gmail.com>

Tested using qemu_xtensa_lx60_defconfig.

Best regards,
Romain
