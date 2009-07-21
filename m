From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2009 08:44:46 +0200
Subject: [Buildroot] standard libc libm support
In-Reply-To: <87d47ueeld.fsf@macbook.be.48ers.dk>
References: <54288.172.16.221.250.1248133430.squirrel@cvs.xtale.biz>
	<87d47ueeld.fsf@macbook.be.48ers.dk>
Message-ID: <20090721084446.099f04e4@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 21 Jul 2009 08:26:38 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

>  nfrench> You are correct it is closed source and linked against
>  nfrench> glibc.  Is there no way that buildroot could build this or
>  nfrench> am I missing something or have I just overlooked a part of
>  nfrench> buildroot, or is it outside the scope of this project.
> 
> The only way to use glibc with buildroot is to generate a glibc
> toolchain with something like crosstool-ng, and use that as an
> external toolchain.
> 
> Thomas Petazzoni afaik uses this.

I confirm.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
