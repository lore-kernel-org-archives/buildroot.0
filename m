From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 19 Jul 2013 16:55:36 -0300
Subject: [Buildroot] qemu_ppc_mpc8544ds_defconfig does not boot
In-Reply-To: <CALR4fELm3cpt=x74-5fhXEr69ukbbE-Q6u_r6rS2qCbL43xVVg@mail.gmail.com>
References: <CALR4fELm3cpt=x74-5fhXEr69ukbbE-Q6u_r6rS2qCbL43xVVg@mail.gmail.com>
Message-ID: <51E999B8.2000806@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/13/2013 06:42 AM, Diego Iastrubni wrote:

> Hi all,
> 
> elcuco at stimpy:~/src/buildroot$ make qemu_ppc_mpc8544ds_defconfig
> elcuco at stimpy:~/src/buildroot$ make
> elcuco at stimpy:~/src/buildroot$ qemu-system-ppc -M mpc8544ds -kernel
> output/images/vmlinux -serial stdio -net nic,model=e1000 -net user
> Unable to copy device tree in memory
> couldn't load device tree
> 
> Can anyone reproduce? I am using
> cca5538556e854516a85b28ae56c06ed66427b71 (master).

Worksforme(tm) on gentoo with qemu 1.4.2.
Which qemu version and distribution? Sounds like a qemu problem to me
(maybe packaging).
Regards.
