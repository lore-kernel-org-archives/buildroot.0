From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Nov 2012 09:33:44 +0100
Subject: [Buildroot] no /etc/hosts error in building root
In-Reply-To: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
References: <slrnkbdlmd.33p.narkewoody@zuhnb712.local.com>
Message-ID: <20121129093344.0d4c46a0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Thu, 29 Nov 2012 03:31:16 +0000 (UTC), Woody Wu wrote:

> I just removed the output/target directory and want to root filesystem
> to be rebuilt by running 'make' again.  But this time I got an error:

This is not supported. You can't remove output/target and expect
Buildroot to reinstall everything.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
