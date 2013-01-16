From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 16 Jan 2013 18:07:21 +0100
Subject: [Buildroot] [Feature Request] script to run after build completion
Message-ID: <50F6DE49.4000600@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

I am picking up a feature request from 2011, because I am currently in a
situation where I could use the proposed feature.

Alper Y?ld?r?m wrote on 8 Jun 2011 22:40
> Hello,
>
> A feature i want to see in buildroot is to have a post build script to
> run after image creation process, in other words just before "make"
> returns to console. This way i can put my post build commands inside
> this script. It will definitely ease my buildroot usage.
>
> Some examples to put in this script are:
>
> - Printing some king of a "build completed" message,
> - Printing build time,
> - Nfs directory creation from rootfs.tar file,
> - Copying necessary images to some other locations,
- any other kind of project/board specific post processing
> - Playing some sound when build is completed.
>
> Also, it will be nice to pass a build failed/completed parameter to
> this script, so different actions could be taken, (i.e. different
> sounds could be played)
I would rather think of a hook that only gets called after successful
image completion.
>
> What do you think about this Thomas?
>
> Cheers
> Alper

I tried to implement such a hook, but did not find the right place.
Could anybody give me a hint?

Kind regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
