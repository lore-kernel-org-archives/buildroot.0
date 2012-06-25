From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jun 2012 11:06:28 +0200
Subject: [Buildroot] [PATCH] php: force cross-compilation
In-Reply-To: <877guv93n6.fsf@macbook.be.48ers.dk>
References: <1340317344-22807-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87y5ndbxgl.fsf@macbook.be.48ers.dk>
 <20120625091219.539a3740@skate>
 <87k3yv95r9.fsf@macbook.be.48ers.dk>
 <20120625100641.7850a1a2@skate>
 <877guv93n6.fsf@macbook.be.48ers.dk>
Message-ID: <20120625110628.0239ffe2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 25 Jun 2012 10:50:21 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Hmm, we could fix this particular problem similar to how you did for
> php, but chances are other native tools would want to poke in /proc. Any
> specific reason you cannot mount /proc to get a more representative
> setup?

No, it's just due to some too limited shell script to enter the chroot,
nothing else.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
