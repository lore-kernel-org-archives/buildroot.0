From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Nov 2011 23:02:32 +0100
Subject: [Buildroot] support for TI PandaBoard?
In-Reply-To: <CALB96N=oQ6KWsQymURs59k=dDhESBbecYvdEuro0_8ye6nCJNQ@mail.gmail.com>
References: <CALB96N=oQ6KWsQymURs59k=dDhESBbecYvdEuro0_8ye6nCJNQ@mail.gmail.com>
Message-ID: <20111122230232.2962b512@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 22 Nov 2011 22:28:35 +0100,
"Dechesne, Nicolas" <n-dechesne@ti.com> a ?crit :

> is there anyone (actively) working on getting Panda support in
> buildroot? Google tells there has been some attempts in the past (
> http://lists.busybox.net/pipermail/buildroot/2011-May/042939.html)...

Philippe Reynes did contribute patches in the past. It took a while to
merge his x-loader patches because I took this opportunity to extend
the package infrastructure to the bootloaders build and the Linux
kernel build. And then, I never got to the point of merging the Panda
defconfig, which I anyway wouldn't have been able to test since I don't
have a Panda.

Therefore, updated patches to add Panda support are definitely welcome.

> Also, while making this config, I realized that there is no support
> for u-boot&SPL in buildroot, that might be a good thing to add as
> well in that process..

It would certainly be worthwhile. Down the road, we might also need to
work on some device tree stuff in Buildroot as well.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
