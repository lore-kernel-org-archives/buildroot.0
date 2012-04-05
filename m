From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Apr 2012 10:04:48 +0200
Subject: [Buildroot] [git commit] Add libcap-ng package.
In-Reply-To: <871uo2ty82.fsf@macbook.be.48ers.dk>
References: <20120404200933.2D85596A01@busybox.osuosl.org>
 <20120405092757.585e48c6@skate>
 <871uo2ty82.fsf@macbook.be.48ers.dk>
Message-ID: <20120405100448.4c0258a1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 05 Apr 2012 09:49:17 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Seems like it, but only for the python bindings. The library itself
> builds fine without largefile support (I tested that).
> 
> It should also ensure it builds after python if enabled for the
> bindings.

And disable the build of the Python bindings if Python is not selected
as a package for the target.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
