From: Guillaume Gardet <guillaume.gardet@free.fr>
Date: Sat, 10 Dec 2011 11:28:22 +0100
Subject: [Buildroot] Make problem on 64-bit linux with CS 2009q1
In-Reply-To: <20111209193729.0cc88e6e@skate>
References: <4EE1CB14.9010802@free.fr> <20111209193729.0cc88e6e@skate>
Message-ID: <4EE33446.3070902@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 09/12/2011 19:37, Thomas Petazzoni a ?crit :
> Hello Guillaume,
>
> Le Fri, 09 Dec 2011 09:47:16 +0100,
> Guillaume Gardet<guillaume.gardet@free.fr>  a ?crit :
>
>> I tried a simple build (.config in attachment) on a 64-bit Linux
>> (openSUSE 12.1) with CS 2009q1 toolchain (and last buildroot trunk)
>> and some libs are built to output/target/usr/lib64/ so they are not
>> found as dependencies. With the .config in attachment, you can try a
>> build and check directfb config.log file and PNG lib and others are
>> not found, so directfb is built without support for them. In the
>> final image, they are also in usr/lib64 folder. It may be a problem
>> for other packages.
>>
>> What could be the problem and how to solve it?
> Yeah, we had report of issues with openSUSE. I guess it's the multilib
> implementation in openSUSE that confuses Buildroot somehow. I need to
> get my hand on an openSUSE system to debug this.
>
> Can you easily provide me a basic chroot environment with openSUSE
> installed in it, or point me to the documentation to set it up
> (knowing, of course, that I don't have openSUSE installed here, so I
> can't use openSUSE specific utilities to build the openSUSE chroot) ?

Cannot you make a VM? Because I cannot provide you an openSUSE chroot.

Guillaume
