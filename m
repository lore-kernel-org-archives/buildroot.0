From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:35:04 +0200
Subject: [Buildroot] Grub2 help for buildroot & EFI
In-Reply-To: <20150331164315.GB22268@postdiluvian.org>
References: <20150331164315.GB22268@postdiluvian.org>
Message-ID: <20150331233504.6a34d107@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mark Mason,

On Tue, 31 Mar 2015 12:43:15 -0400, Mark Mason wrote:

> Can someone suggest where I can get some help getting buildroot to
> boot off a thumb drive with grub2 in an x86 64 bit EFI environment?
> The buildroot portion of the project went smoothly, as usual, but I'm
> using grub instead of U-Boot this time and I'm mired in mysterious
> failures when trying to do something that should be trivial.

Did you look at the help text of the Grub 2 option in Buildroot? It
contains a fairly comprehensive list of steps on how to install Grub 2
EFI :

  http://git.buildroot.net/buildroot/tree/boot/grub2/Config.in#n69

The instructions were tested with Qemu, but they should apply with
little or even no change to a real platform.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
