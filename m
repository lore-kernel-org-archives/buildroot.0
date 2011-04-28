From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Apr 2011 14:09:19 +0200
Subject: [Buildroot] [PATCH v3] libnl: bump to version 3.0
In-Reply-To: <4DB91798.6050601@visionsystems.de>
References: <4DB8134E.1030503@visionsystems.de>
	<4DB91798.6050601@visionsystems.de>
Message-ID: <20110428140919.77d3027f@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 28 Apr 2011 09:30:32 +0200
Yegor Yefremov <yegor_sub1@visionsystems.de> wrote:

> I would leave AUTORECONF option. On my old build system  openSUSE
> 10.3 libnl-3.0 would compile only if reconfigured, otherwise it
> cannot find some header files. On my new Ubuntu 11.04 distro I don't
> have such problems. What do you think about this?

I'd say we need more specific details on the header files issue rather
than blindly deciding to use the <pkg>_AUTORECONF=YES big hammer :-)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
