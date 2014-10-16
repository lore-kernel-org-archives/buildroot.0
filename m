From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 10:08:31 +0200
Subject: [Buildroot] qemu compiling error
In-Reply-To: <543F6BBE.3070000@free.fr>
References: <543E3CBC.5080901@free.fr>
	<543F6BBE.3070000@free.fr>
Message-ID: <20141016100831.21a48426@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear St?phane ANCELOT,

On Thu, 16 Oct 2014 08:54:54 +0200, St?phane ANCELOT wrote:

> I want being able to emulate an x86 32 bits platform from a 64 bits os 
> with qemu launched in buildroot.
> 
> The build fails because --disable-system option is enabled and thus 
> inhibits selection target-list i386soft-mmu to build.
> removing --disable-system this option will permit to build it.

This is because for now the Qemu package for the host is for now
limited to building the Qemu userspace emulation, and does not support
building the Qemu system emulation.

> Please correct it.

Do you realize that you're talking to an open-source community, and not
your employees? Asking for something to be fixed the way you did it is
the best way to make the maintainers/developers angry and to ignore
your problem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
