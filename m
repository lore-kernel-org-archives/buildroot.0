From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Mon, 30 Jul 2012 16:13:58 -0500
Subject: [Buildroot] populating an initramfs
Message-ID: <CAE9DZURcJ-4nb5-xA+yVyLf8msVr=ca6DAX2ZTY_OD0w+1n6vQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

Forgive me in advance for asking a newb question.  I'm in the process
of converting from Yocto/OE.

I have the need to populate both an initramfs as well as a rootfs with
the contents of packages I build using buildroot.  What is the best
way to do this?   Should I create two separate projects, one for the
initramfs and one for the rootfs?  Or is there a way to select which
contents go in each and keep it all in the same project?

Thanks,

Dallas
