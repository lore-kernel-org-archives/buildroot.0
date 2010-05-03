From: Microbit_P43000 <microbit@virginbroadband.com.au>
Date: Tue, 4 May 2010 02:28:57 +1000
Subject: [Buildroot] Buildroot 2010.05-rc1 released
In-Reply-To: <876335dpke.fsf@macbook.be.48ers.dk>
References: <876335dpke.fsf@macbook.be.48ers.dk>
Message-ID: <22D2F3BAE6084DD9B6A63A3BC8D925A7@development>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] On Behalf Of
> Peter Korsgaard
> Sent: Tuesday, 4 May 2010 12:32 AM
> To: buildroot at uclibc.org
> Subject: [Buildroot] Buildroot 2010.05-rc1 released
> 
> Hi,
> 
> Buildroot 2010.05-rc1 is released - Go download it at:
> 
> http://buildroot.net/downloads/buildroot-2010.05-rc1.tar.gz
> 
> or
> 
> http://buildroot.net/downloads/buildroot-2010.05-rc1.tar.bz2
> 
> Or get it from Git:
> 
> git://git.buildroot.net/buildroot
> 
> Please give it a spin and report any problems to the mailing list or bug
> tracker. Many thanks to the people contributing to this release:
> 
>  git shortlog -s -n 2010.02..
>    220  Paulius Zaleckas
>    123  Thomas Petazzoni
>    220  Paulius Zaleckas
>    123  Thomas Petazzoni
>     92  Peter Korsgaard
>     26  Will Wagner
>     22  Gustavo Zacarias
>     14  Lionel Landwerlin
>      3  Darius Augulis
>      3  H Hartley Sweeten
>      3  Josh.Wu
>      3  Yann E. MORIN
>      2  Alexander Clouter
>      2  Kelvin Cheung
>      2  Luca Ceresoli
>      2  Richard van Paasen
>      1  Chris Seawood
>      1  Frederik Vannoote
>      1  Grant Edwards
>      1  Johan Thelin
>      1  Laine Walker-Avina
>      1  Michael Roth
>      1  Mike Crowe
>      1  Paul Jones
>      1  Thomas Brandstetter
> 
> >From now on the tree is closed for new features until after the 2010.05
> release (expected at end of month).
> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot



Sounds great, I'll be trying it in next couple of days.

This might be ignorant, but can I enquire regarding these 2 issues compared to 2010.02
vis-?-vis
target behaviour :
(I haven't followed patches/bugs properly, and couldn't seem to readily Google about
status of ->)

i) 2010.02 hides the hotplug and udev options, although busybox doesn't offer it.
Just mdev alone is not proper of course, since there's no rc script then.

ii) Once that was fixed, I find that I can't mount/read SD cards with ext2/ext3 format on
it.
It does mount FAT(32) properly. I'm using 2.6.31.6 on my ARM9 target.
When Googling I did read something about new kernel supporting ext2/3 through ext4 driver.
Does this apply to 2010.02 as well ? IOW does this mean I should upgrade my kernel ?
Using 2009.11 with same kernel still flashed in target (I only flash rootfs), ext2/3
mounts fine on that same target...

** Am I missing something in 2010.02 ? I can't see where my mistake would be...

If (i) and/or (ii) indeed are an ongoing issue, will/is this fixed on 2010.05 ???
(unless it's already in your release cand...)

Best Regards,
Kris
