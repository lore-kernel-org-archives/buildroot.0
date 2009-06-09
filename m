From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue, 9 Jun 2009 14:52:04 +0200
Subject: [Buildroot] [PATCH] Remvoed dm (devicemapper),
 this is included in the new lvm2 package
In-Reply-To: <4A2E4365.50709@lbsd.net>
References: <4A2E1F81.4020505@lbsd.net>
	<20090609110050.4c7ce51c@bandomeer.europe.flane.local>
	<4A2E4365.50709@lbsd.net>
Message-ID: <20090609145204.2944be52@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 09 Jun 2009 11:11:33 +0000
Nigel Kukard <nkukard@lbsd.net> wrote:

> 
> > the lvm2 suite has many files and the binary is *big*, so please include 
> > some logic to only install dmsetup like the patch in Bug#241 had.
> >   
> Your patch is a whole log more complete than mine, I'll check it out and
> submit it to be committed if everything is 100%.
> 
> -N
> 
I'm currently using that patch with v2.02.45.
Since .47 is the current upstream version, this might need an update.

Regards
Olaf
