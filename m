From: Diego Iastrubni <diegoiast@gmail.com>
Date: Sat, 13 Jul 2013 12:42:59 +0300
Subject: [Buildroot] qemu_ppc_mpc8544ds_defconfig does not boot
Message-ID: <CALR4fELm3cpt=x74-5fhXEr69ukbbE-Q6u_r6rS2qCbL43xVVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

elcuco at stimpy:~/src/buildroot$ make qemu_ppc_mpc8544ds_defconfig
elcuco at stimpy:~/src/buildroot$ make
elcuco at stimpy:~/src/buildroot$ qemu-system-ppc -M mpc8544ds -kernel
output/images/vmlinux -serial stdio -net nic,model=e1000 -net user
Unable to copy device tree in memory
couldn't load device tree

Can anyone reproduce? I am using
cca5538556e854516a85b28ae56c06ed66427b71 (master).
