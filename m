From: =?ISO-8859-9?B?QWxwZXIgWf1sZP1y/W0=?= <yildirimalper@gmail.com>
Date: Wed, 8 Jun 2011 23:40:14 +0300
Subject: [Buildroot] [Feature Request] script to run after build completion
Message-ID: <BANLkTinE6NPRM67GbdAXutwxOfeHGS_P_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

A feature i want to see in buildroot is to have a post build script to
run after image creation process, in other words just before "make"
returns to console. This way i can put my post build commands inside
this script. It will definitely ease my buildroot usage.

Some examples to put in this script are:

- Printing some king of a "build completed" message,
- Printing build time,
- Nfs directory creation from rootfs.tar file,
- Copying necessary images to some other locations,
- Playing some sound when build is completed.

Also, it will be nice to pass a build failed/completed parameter to
this script, so different actions could be taken, (i.e. different
sounds could be played)

What do you think about this Thomas?

Cheers
Alper
