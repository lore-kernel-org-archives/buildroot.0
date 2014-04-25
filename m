From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Fri, 25 Apr 2014 23:42:44 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <535AAF25.8090309@mind.be>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
 <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
 <535985BA.1020009@mind.be>
 <CAEzGmjC+Hob859rdVSD74BsX5R+mwkNRtwsA5Pet=rM+uY4hwQ@mail.gmail.com>
 <535AAF25.8090309@mind.be>
Message-ID: <CAEzGmjALnnk=Mqj7pirEnTZ5qvAh_DY7jR6iHnZbQMt+HLL41w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  Ah sorry, grub2 has only been added a couple of weeks ago. But
> grub-legacy should work fine as well.
>
>
>
Hm... my mbr on the target CF mentions LILO. Should I for grub-legacy do as
follows?
Use dd to copy (part of?) the 512 bytes
from /media/lennart/5fcblablblabla620/boot/grub/stage1
to /dev/sdX

And then copy the e2fs_stage1_5 with destination beginning at 512?

Or is there a safer trick to install grub here?

Thanks and regards.
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140425/615dfb91/attachment.html>
