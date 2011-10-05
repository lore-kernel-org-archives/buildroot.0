From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Oct 2011 08:43:40 +0200
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
Message-ID: <20111005084340.204661fb@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Oct 2011 18:05:04 -0500,
H Hartley Sweeten <hartleys@visionengravers.com> a ?crit :

> I think the problem with pkg-stats is due to your patches:
> 
>  package: remove useless arguments from CMAKETARGETS
>  package: remove useless arguments from AUTOTARGETS
>  package: remove useless arguments from GENTARGETS
>  package: add helper functions to get package name and directory
> magically

Yes.

> The grep tests are still looking for the package name and directory to
> determine the package type.
> 
> I'll post a patch shortly.

I already have a patch that fixes pkg-stats, which I intend to post
shortly. But if you are quicker than me, no problem :)

> One other thing with pkg-stats.
> 
> Can you think of any way to pull the _VERSION of the packages out of
> the *.mk files and show that information in the output html file?

Yes, shouldn't be too difficult. Why would this be useful ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
