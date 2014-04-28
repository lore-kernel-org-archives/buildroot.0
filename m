From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Mon, 28 Apr 2014 14:33:19 +0200
Subject: [Buildroot] How transfer what image(s) to target-CF?
In-Reply-To: <20140427213936.6262021b@tux>
References: <CAEzGmjA3wbjEFb6sQYov_rJFJuB8oJFx2Y6XOA7WWHce743=dg@mail.gmail.com>
 <5357DD2D.1030702@mind.be>
 <CAEzGmjCXKEQTEEbz7a9JfX80rVafF4XedTjfZDQYyVOypASgAA@mail.gmail.com>
 <535985BA.1020009@mind.be>
 <CAEzGmjC+Hob859rdVSD74BsX5R+mwkNRtwsA5Pet=rM+uY4hwQ@mail.gmail.com>
 <535AAF25.8090309@mind.be>
 <CAEzGmjALnnk=Mqj7pirEnTZ5qvAh_DY7jR6iHnZbQMt+HLL41w@mail.gmail.com>
 <20140426092314.19527a1b@tux>
 <CAEzGmjDkpu3KaYJMKXXQJVD49296+MXgFD3760auo=TU56a5_Q@mail.gmail.com>
 <20140427213936.6262021b@tux>
Message-ID: <CAEzGmjByYAXYo2bbnKqRcu4nzJfjbEz8ZsaiB_MdSNQgDs2M3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Apr 27, 2014 at 9:39 PM, Bj?rn Kirchner <bjoern@am-soft.de> wrote:

>
> The instructions refered to grub-legacy. I thougt you would use
> grub-legacy because you wrote you could not select grub2.
> In buildroot 2013.08 there is a /sbin/grub in the rootfs image,
> if in the .config "BR2_TARGET_GRUB=y" is set. But there is no
> "BR2_TARGET_GRUB_FS_EXT2" in my .config.
>
>
>
Hi Bj?rn,
Yes, I am talking about grub-legacy only.

Maybe I should wait for grub2. Is that to be expected in the next stable
release, anyone?

Regards
Lennart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140428/4f30af22/attachment.html>
