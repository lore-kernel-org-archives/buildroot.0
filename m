From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 09:17:52 +0200
Subject: [Buildroot] problems compiling uclibc for Geode (i386)
In-Reply-To: <87liwdyzy8.fsf@macbook.be.48ers.dk>
References: <1309291371.21632.5.camel@bender> <1309350574.17457.5.camel@sven>
 <20110629164330.1f5780a7@skate>
 <4E0B3B3D.3090108@in-2-technology.co.uk>
 <20110629165517.49e81d99@skate>
 <87liwdyzy8.fsf@macbook.be.48ers.dk>
Message-ID: <20110705091752.6d1b9887@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 05 Jul 2011 09:00:15 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I've fixed it now. Perhaps we should consider defaulting to something
> slightly less ancient than i386.

Agreed. At least i486 or i586 seems like a good default.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
