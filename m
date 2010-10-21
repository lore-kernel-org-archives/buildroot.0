From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Oct 2010 10:43:19 +0200
Subject: [Buildroot] GPIO
In-Reply-To: <SNT119-W45EBAC8F8EBBF3D046BA77825D0@phx.gbl> (Johnny
	Beardsmore's message of "Thu, 21 Oct 2010 08:29:13 +0000")
References: <SNT119-W45EBAC8F8EBBF3D046BA77825D0@phx.gbl>
Message-ID: <87wrpc0wd4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johnny" == Johnny Beardsmore <jny0@hotmail.com> writes:

 Johnny> Hi,
 Johnny> I product I worked on a while ago has returned to haunt me.

 Johnny> Essentially, I need support for a GPIO port on a pc-104.  I've
 Johnny> perused the configuration settings in Buioldroot, but wasn't
 Johnny> able to spot anything that looked suitable.  Is it, and has
 Johnny> anyone any experience with doing so?

That's a kernel question rather than an issue about userspace rootfs
configuration.

Have a look at the gpio options in the kernel and Documentation/gpio.txt
in the kernel sources for information of how to access them through
sysfs.

-- 
Bye, Peter Korsgaard
