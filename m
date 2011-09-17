From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Sep 2011 09:13:33 +0200
Subject: [Buildroot] [PATCH 01/15] package: show complete URL for
 external-deps
In-Reply-To: <87zki3wuhj.fsf@macbook.be.48ers.dk>
References: <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <cover.1314826231.git.thomas.petazzoni@free-electrons.com>
 <9a55925fbd5588fb01890a48d15a46b06c93fed4.1314826231.git.thomas.petazzoni@free-electrons.com>
 <87zki3wuhj.fsf@macbook.be.48ers.dk>
Message-ID: <20110917091333.6d80760b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sat, 17 Sep 2011 08:31:04 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Hmm, the uses case for external-deps were:
> 
>  - What files from the dl/ dir do I need to copy over to new machine
> to be able to build this config without internet connectivity?
> 
>  - What files do I need to archive (next to buildroot) to ensure I can
>    rebuild this config in years to come?
> 
> - What files do I need to provide to customers in addition to
> buildroot for GPL compliance?
> 
> For all of those the upstream URL isn't really interesting

Ok. To me this sounds like a strange behaviour for something called
"external-deps", I would have expected to see the *external*
dependencies, i.e what I need from the Internet, besides Buildroot, to
be able to build my system.

> - Perhaps we should fix the svn/bzr/git helpers instead?

What should they show ? The name of the local tarball that has been
created after the svn checkout / git clone ?

And what should we display in the case of a local package (as added by
this patchset) ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
