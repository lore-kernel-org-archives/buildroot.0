From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue, 9 Jun 2009 11:00:50 +0200
Subject: [Buildroot] [PATCH] Remvoed dm (devicemapper),
 this is included in the new lvm2 package
In-Reply-To: <4A2E1F81.4020505@lbsd.net>
References: <4A2E1F81.4020505@lbsd.net>
Message-ID: <20090609110050.4c7ce51c@bandomeer.europe.flane.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

the lvm2 suite has many files and the binary is *big*, so please include 
some logic to only install dmsetup like the patch in Bug#241 had.

Regards
Olaf

On Tue, 09 Jun 2009 08:38:25 +0000
Nigel Kukard <nkukard@lbsd.net> wrote:

> 
> 
> -------- Original Message --------
> Subject: 	[PATCH] Remvoed dm (devicemapper), this is included in the new
> lvm2 package
> Date: 	Mon, 01 Jun 2009 11:33:47 +0000
> From: 	Nigel Kukard <nkukard@lbsd.net>
> To: 	buildroot at busybox.net
> 
> 
> 
> The devicemapper library is now included in LVM2.
> 
> Updated the lvm2 package to include the library during installation
> and updated dmraid to depend on lvm2.
> 
> 
