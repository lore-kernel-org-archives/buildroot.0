From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Dec 2013 10:46:44 +0100
Subject: [Buildroot] generate uImage file
In-Reply-To: <1651747.2nkJEYoDym@regdesktophome>
References: <1651747.2nkJEYoDym@regdesktophome>
Message-ID: <20131218104644.364648bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ron Eggler,

On Tue, 17 Dec 2013 21:50:50 +0000, Ron Eggler wrote:

> I just changed my buildroot config to generate a uImage file. I then
> did a "make clean" followed by a make but for both I get:
> linux/linux.mk:339: *** No kernel configuration file specified, check
> your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.  Stop.
> 
> What does this mean? How do I fix this to compile again?

You have selected the choice of providing a kernel configuration file
to configure the kernel, but you did not give Buildroot the path to
this file with the BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE configuration
option.

If you think something is not working well, please provide your
complete Buildroot .config file.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
