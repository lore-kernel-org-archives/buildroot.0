From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Aug 2009 17:19:39 -0400
Subject: [Buildroot] Building Linux system - Beginner
In-Reply-To: <BAY136-W16239DD29A416E7AEDD40CE0C0@phx.gbl>
References: <mailman.16306.1249386189.24852.buildroot@busybox.net>
	<BAY136-W16239DD29A416E7AEDD40CE0C0@phx.gbl>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE190901B77805@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, August 04, 2009 2:00 PM, Raed Abu-Sanad wrote:
> Hi Dan and Hartley,,
> 
> Here is what i am getting:
> 
> root at raed-laptop:/home/raed/temp/buildroot-2009.05# make linux26-menuconfig
> make: *** No rule to make target `linux26-menuconfig'. Stop.
> 

In your buildroot .config do you have BR2_KERNEL_LINUX or BR2_KERNEL_LINUX_ADVANCED?
If you don't, the appropriate Makefile will not be included so you will not have
the rules for the target.

Regards,
Hartley
