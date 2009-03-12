From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Mar 2009 11:22:46 +0100
Subject: [Buildroot] [buildroot question] question about toolchain
 options----large file support
In-Reply-To: <87k56vt7ne.fsf@macbook.be.48ers.dk>
References: <2ae8403e0903120212h78d65edduaa7e2f5a9dde5da1@mail.gmail.com>
	<87k56vt7ne.fsf@macbook.be.48ers.dk>
Message-ID: <20090312112246.302f8f2d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 12 Mar 2009 10:25:25 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  IaMaPlAyEr> I want to delete all toolchain_build_mips dir and rebuild
>  IaMaPlAyEr> all project,? is the best way ?
> 
> You better delete all the build dirs (rm -rf *build_*) to be safe.

Is there any "make somethingclean" to do that ? I also frequently end
up doing rm -rf *build_*.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
