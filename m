From: Carlos Santos <unixmania@gmail.com>
Date: Sat, 12 Oct 2019 14:08:39 -0300
Subject: [Buildroot] [PATCH] package/x11r7/xserver_xorg-server: fix
 mesa3d glx support
In-Reply-To: <d0997gx8vh.ln2@ID-313208.user.individual.net>
References: <20191012144925.14157-1-unixmania@gmail.com>
 <d0997gx8vh.ln2@ID-313208.user.individual.net>
Message-ID: <CAJ4jsadw12BBQwzXhDWmFdmktpUQjMe69SrSNGtQFKcMG_DoWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 12, 2019 at 12:50 PM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Am Sat, 12 Oct 2019 11:49:25 -0300 schrieb
> unixmania-Re5JQEeQqe8AvxtiuMwx3w:
>
> >  board/pandaboard/post-image.sh                   | 16 ----------------
> >  configs/pandaboard_defconfig                     |  3 ++-
>
> Hi Carlos,
>
> are these changes related to xserver_xorg-server?
>
> Regards, Bernd

Yes, for sure.

-- 
Carlos Santos <unixmania@gmail.com>
