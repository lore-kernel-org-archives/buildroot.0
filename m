From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 13 Jul 2010 08:55:16 +0200
Subject: [Buildroot] Problems with custom config of kernel 2.6.34.1
In-Reply-To: <4C3B80A7.1040305@gmx.net>
References: <4C3B80A7.1040305@gmx.net>
Message-ID: <20100713085516.5a5c8d26@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marcus,

On Mon, 12 Jul 2010 22:52:55 +0200
Ossy <ossy1980@gmx.net> wrote:

> Hi mailinglist,
> 
> I use the kernel version 2.6.33.6 without any problems. But since I 
> updated to the newer version 2.6.34.1 I'm not able to use a custom 
> config anymore.
> 
> I loaded the old config into the kernel menuconfig and stored it as
> new file linux-2.6.34.1.config. When I launched the overall make
> process the kernel patches were applied fine, but the process runs
> into text mode configuration:

Thanks for your report. Could you provide a step-by-step procedure to
reproduce the problem from scratch ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
