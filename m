From: Nigel Kukard <nkukard@lbsd.net>
Date: Tue, 09 Jun 2009 11:11:33 +0000
Subject: [Buildroot] [PATCH] Remvoed dm (devicemapper),
 this is included in the new lvm2 package
In-Reply-To: <20090609110050.4c7ce51c@bandomeer.europe.flane.local>
References: <4A2E1F81.4020505@lbsd.net>
	<20090609110050.4c7ce51c@bandomeer.europe.flane.local>
Message-ID: <4A2E4365.50709@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> the lvm2 suite has many files and the binary is *big*, so please include 
> some logic to only install dmsetup like the patch in Bug#241 had.
>   
Your patch is a whole log more complete than mine, I'll check it out and
submit it to be committed if everything is 100%.

-N
