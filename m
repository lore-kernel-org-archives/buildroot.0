From: p <pmeloy@shaw.ca>
Date: Mon, 28 Apr 2008 10:15:45 -0700
Subject: [Buildroot] lockfiles got it
In-Reply-To: <1209402063.3050.13.camel@rhodan.rho>
References: <48109359.5010204@logicway.de> <1209401096.3050.6.camel@rhodan.rho>
	<1209402063.3050.13.camel@rhodan.rho>
Message-ID: <1209402945.26710.3.camel@rhodan.rho>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It looks like buildroot doesn't like the 1.11-0.1 as there are
compilation errors (I renamed the build_arm directory to match the
package and mk names).

I googled and found an ubuntu source tarball for 1.11 that worked
flawlessly (just hope the ubuntu sources works as a binary too). Except
I now see why sid was used - the tarball has everything in a directory
named sid instead of the package name.


On Mon, 2008-04-28 at 10:01 -0700, p wrote:
> Oop. the directory does not in fact exist. lockfile-progs-0.1.11 is
> created even though the version was set to 0.1.11-0.1
> 
> I should also mention that
> 
> LOCKFILE_PROGS_DIR:=$(BUILD_DIR)/sid
> 
> somehow made it in.
> 
> 
> 
> 
> 
> On Mon, 2008-04-28 at 09:44 -0700, p wrote:
> > In reality .unpacked is missing for some reason.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
