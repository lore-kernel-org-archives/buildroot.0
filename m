From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 09:34:16 +0100
Subject: [Buildroot] no /etc/hosts error in building root
In-Reply-To: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
References: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
Message-ID: <20121129093416.2cf28e51@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Thu, 29 Nov 2012 03:31:16 +0000 (UTC), Woody Wu wrote:

> BTW:  If I also want the root iamges under output/images directory to be
> regenerated, is that enough to only remobe the output/target and run
> 'make'?  I tried something like 'make root-rebuild' and 'make
> rootfs-rebuild' but they do not work.

Just run "make". The images in output/images/ and re-generated from the
contents of output/target at every make invocation.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
