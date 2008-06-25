From: Sean Perry <shaleh@speakeasy.net>
Date: Tue, 24 Jun 2008 23:17:50 -0700
Subject: [Buildroot] Problem with hotplug
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE19091D71FA@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE19091D71FA@mi8nycmail19.Mi8.com>
Message-ID: <4861E30E.1090404@speakeasy.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hartleys wrote:
> Does the hotplug utility work in the latest svn of buildroot?
> 
> When I plug in a USB memory stick it gets detected by the kernel but
> does not auto mount. I'm not sure if I have something else setup wrong
> or if the hotplug utility is just not working.
> 
> I tried enabling DEBUG in the source to get the dbg messages but the
> code will not compile.
> 
> Can anyone offer some assistance please?
> 

I had the impression that the hotplug in packages was for older 2.6 and 
2.4 kernels.

The kernel just runs /sbin/hotplug when it detects new hardware. Write a 
simple script to mount things. Also, consider looking at HAL.
