From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 May 2011 22:27:31 +0200
Subject: [Buildroot] [RFC] Review request for branch
 for-2011.08/bootloaders
In-Reply-To: <4DE022AC.2010205@lucaceresoli.net>
References: <cover.1305577083.git.thomas.petazzoni@free-electrons.com>
	<4DE022AC.2010205@lucaceresoli.net>
Message-ID: <20110530222731.26b0eabe@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

On Sat, 28 May 2011 00:16:12 +0200
Luca Ceresoli <luca@lucaceresoli.net> wrote:

> Thank you for your big work. I appreciate it very much.
> I currently build my bootloaders and kernel outside buildroot just
> because I need to fetch them from local git repositories.
> Bringing them in buildroot would significantly simplify my build system.
> 
> I tested your patchset and it worked perfectly.

Great, thanks! Nice to see that it worked for you. It's definitely
useful having others testing the proposed features.

> I had to hack linux.mk and u-boot.mk because the git download method is 
> not yet implemented, but it was straightforward in the package infrastructure.
> This way I got both the bootloader and the kernel working on my board.
> 
> I look forward to see your next patchset and test it. Will it implement
> a git download option in menuconfig?

Yes, it implements a git download option in menuconfig for the kernel
and for u-boot.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
