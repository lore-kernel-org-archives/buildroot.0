From: hartleys <hartleys@visionengravers.com>
Date: Thu, 29 Jan 2009 17:31:14 -0500
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86: i686
In-Reply-To: <1233266903.4147.60.camel@elrond.atmel.com>
References: <20090129192525.2264976D75@busybox.osuosl.org>
	<BD79186B4FD85F4B8E60E381CAEE19090114B4E9@mi8nycmail19.Mi8.com>
	<1233266903.4147.60.camel@elrond.atmel.com>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090114B587@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, January 29, 2009 3:08 PM, Ulf Samuelsson wrote:
> tor 2009-01-29 klockan 15:30 -0500 skrev hartleys:
> > On Thursday, January 29, 2009 12:25 PM, ulf at uclibc.org wrote:
> > > Log:
> > > Update x86 BSP to latest uclibc/linux/tools versions
> > > 
> > > Added:
> > >    trunk/buildroot/target/device/x86/i686/
> > >
trunk/buildroot/target/device/x86/i686/i686-linux-2.6.28.2.config
> > >    trunk/buildroot/target/device/x86/i686/i686_defconfig
> > > 
> > > Removed:
> > >    trunk/buildroot/target/device/x86/i386/
> > > 
> > > Modified:
> > >    trunk/buildroot/target/device/x86/Config.in
> > >    trunk/buildroot/target/device/x86/Makefile.in
> > >    trunk/buildroot/target/device/x86/i686/Makefile.in
> > >    trunk/buildroot/target/device/x86/i686/i386_defconfig
> > > 
> > 
> > Ulf,
> > 
> > trunk/buildroot/target/device/x86/Config.in has the same issue as 
> > ARMLTD did.
> > 
> > $ make menuconfig
> > target/device/x86/Config.in:14:warning: defaults for choice values
> > not supported
> > 
> 
> I have gone through the ARM and x86 and updated to latest toolset
> and versions, and I think both ARM and x86 shouldbe OK by now.
> If someone disagrees, pls provide feedback.

It all looks good to me now...

Regards,
Hartley
