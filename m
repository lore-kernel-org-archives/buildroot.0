From: =?ISO-8859-15?B?Qmr2cm4=?= Kirchner <bjoern@am-soft.de>
Date: Sun, 27 Apr 2014 21:39:35 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <CAEzGmjDkpu3KaYJMKXXQJVD49296+MXgFD3760auo=TU56a5_Q@mail.gmail.com>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
 <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
 <535985BA.1020009@mind.be>
 <CAEzGmjC+Hob859rdVSD74BsX5R+mwkNRtwsA5Pet=rM+uY4hwQ@mail.gmail.com>
 <535AAF25.8090309@mind.be>
 <CAEzGmjALnnk=Mqj7pirEnTZ5qvAh_DY7jR6iHnZbQMt+HLL41w@mail.gmail.com>
 <20140426092314.19527a1b@tux>
 <CAEzGmjDkpu3KaYJMKXXQJVD49296+MXgFD3760auo=TU56a5_Q@mail.gmail.com>
Message-ID: <20140427213936.6262021b@tux>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 27 Apr 2014 18:37:57 +0200
schrieb Lennart Ramberg <ramberg.lennart@gmail.com>:

> On Sat, Apr 26, 2014 at 9:23 AM, Bj?rn Kirchner <bjoern@am-soft.de>
> wrote:
> 
> > ...
> > I don't know if that is safer, but I used the target grub
> > build by buildroot to install itself to the CF card.
> > - Become root on your host system
> > - Execute </full/path/to/your/cfcard>/sbin/grub
> >
> >
> 
> Thanks Bj?rn,
> However, there is no grub in that sbin in the CF
> and listing the files in output/images/rootfs.tar shows no grub
> in ./sbin/

The instructions refered to grub-legacy. I thougt you would use
grub-legacy because you wrote you could not select grub2.
In buildroot 2013.08 there is a /sbin/grub in the rootfs image, 
if in the .config "BR2_TARGET_GRUB=y" is set. But there is no
"BR2_TARGET_GRUB_FS_EXT2" in my .config.

> 
> In .config, the only 'GRUB' that are set are:
> BR2_TARGET_GRUB
> BR2_TARGET_GRUB_FS_EXT2
> 
> I'm using Buildroot-2014.02
> 
> Regards
> Lennart
