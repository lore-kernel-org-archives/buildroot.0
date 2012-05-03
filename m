From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 May 2012 23:17:26 +0200
Subject: [Buildroot] Building For Host as Target
In-Reply-To: <1654518205551106600@unknownmsgid>
References: <CADwac6DA5MDVkfZDmAO-s2+rPsebpefJ-paTWLzkk0hC_qAOZg@mail.gmail.com>
 <20120503181423.35715875@skate> <1654518205551106600@unknownmsgid>
Message-ID: <20120503231726.25b32670@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 3 May 2012 23:14:30 +0300,
Assaf Inbal <shmuelzon@gmail.com> a ?crit :

> While host variants will run, it means that I still need to compile
> for some target platform. The output in the host directory will also
> include many other things not needed. Unless someone will come up
> with a better idea, I'm considering creating a new toolchain type
> (along side with buildroot and "external"). If I'll be pleased with
> the result I'll post a patch.

I am really not sure to understand what your use case is. The principle
of Buildroot is to generate an embedded Linux for a target platform
that has a different CPU architecture than the build platform, and
Buildroot uses cross-compilation to achieve this. If you're outside
this basic principle of Buildroot, I would probably say that Buildroot
isn't the right tool for the job you're trying to do.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
