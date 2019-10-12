From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 17:37:07 -0300
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix
 mesa3d glx support
In-Reply-To: <CAJ4jsadw12BBQwzXhDWmFdmktpUQjMe69SrSNGtQFKcMG_DoWA@mail.gmail.com>
References: <20191012144925.14157-1-unixmania@gmail.com>
 <d0997gx8vh.ln2@ID-313208.user.individual.net>
 <CAJ4jsadw12BBQwzXhDWmFdmktpUQjMe69SrSNGtQFKcMG_DoWA@mail.gmail.com>
Message-ID: <CAJ4jsacFH8C_32Gb-512YZ4Jh7FnM9aCO8paw+=LEA-G+oVTNg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 12, 2019 at 2:08 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Sat, Oct 12, 2019 at 12:50 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> >
> > Am Sat, 12 Oct 2019 11:49:25 -0300 schrieb
> > unixmania-Re5JQEeQqe8AvxtiuMwx3w:
> >
> > >  board/pandaboard/post-image.sh                   | 16 ----------------
> > >  configs/pandaboard_defconfig                     |  3 ++-
> >
> > Hi Carlos,
> >
> > are these changes related to xserver_xorg-server?
> >
> > Regards, Bernd
>
> Yes, for sure.

No, the removal of configs/pandaboard_defconfig was a mistake. I will
send a new patch.

-- 
Carlos Santos <unixmania@gmail.com>
