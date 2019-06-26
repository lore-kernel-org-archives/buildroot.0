From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 25 Jun 2019 22:34:34 -0600
Subject: [Buildroot] [PATCH 1/1] package/weston-imx: Split weston-imx
 off from weston
In-Reply-To: <20190626035847.jcsq7ulueclcmax3@sapphire.tkos.co.il>
References: <20190625225008.58056-1-james.hilliard1@gmail.com>
 <20190626035847.jcsq7ulueclcmax3@sapphire.tkos.co.il>
Message-ID: <CADvTj4r9oO=KdternzH6hRnXW7m14KJgzzFYx+65dP=5F8Kvqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 25, 2019, 9:58 PM Baruch Siach <baruch@tkos.co.il> wrote:

> Hi James,
>
> Adding Garry to Cc.
>
> On Tue, Jun 25, 2019 at 04:50:08PM -0600, James Hilliard wrote:
> > This is in preparation for migration of weston to the meson build system.
> > Since weston-imx is based off of a much older version of weston it is
> > difficult to maintain as part of the weston package.
>
> It might be easier to bump weston-imx to rel_imx_4.19.35_1.0.0 which is
> based
> on upstream version 6.0.0.
>
From what I could tell the imx features were only set up for autotools for
that version as well.

>
> baruch
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190625/f5f496e1/attachment.html>
