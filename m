From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Sep 2011 10:46:56 +0200
Subject: [Buildroot] [git commit] Add xenomai real-time Framework to
 buildroot
In-Reply-To: <CAAXf6LUypr_EHGnwEfAbpWYpQFrfdNw9zvy0muECOkCyBx1CGA@mail.gmail.com>
References: <20110918210214.D4A1A8D5CD@busybox.osuosl.org>
 <CAAXf6LUypr_EHGnwEfAbpWYpQFrfdNw9zvy0muECOkCyBx1CGA@mail.gmail.com>
Message-ID: <20110919104656.3ebdeb08@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 19 Sep 2011 10:33:22 +0200,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Thanks for these fixes.

You're welcome!

> This pattern of needing to add something to ld.so.conf only if it
> isn't present yet, seems something generic to me, i.e. it could be
> useful to other packages as well. Do you think it's worth it to add a
> small infrastructure to the Makefile.package.in for that?

Actually, I have a set of Xenomai fixes which I've done yesterday, and
the ld.so.conf trick is no longer needed. I will send those soon.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
