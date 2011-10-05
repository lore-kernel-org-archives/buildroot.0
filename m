From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2011 08:45:50 +0200
Subject: [Buildroot] How to create package that build with scons
In-Reply-To: <201110041820.16324.arnout@mind.be>
References: <CANc=jjo0e1tvgSm2KTiFaxBd3pPW4zJs=pZ8HVsyFCYGhyLqnw@mail.gmail.com>
 <20111004105449.GB22823@sapphire.tkos.co.il>
 <201110041820.16324.arnout@mind.be>
Message-ID: <20111005084550.39f499ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Oct 2011 18:20:16 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  'make host-scons' works for me...
> 
>  There is currently no package that depends on scons, but I guess
> that it was used by some private package of Thomas (or one of his
> customers).

Not for a private package. I submitted as part of a patchset that
included packages for the disko multimedia framework and its demo
programs. However, Peter had some comments of my disko/disko-demos
packages, and he did merge only the scons package. I haven't (yet)
found the time to adjust the disko/disko-demos packages and to submit
them. This explains why there is a host-scons package that isn't used
by any package in the tree.

But at least, with this host-scons package, I was able to build fine
other packages relying on the Scons build system.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
