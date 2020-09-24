From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 24 Sep 2020 22:17:01 +0200
Subject: [Buildroot] [RFC v1 13/13] package/gst-omx: bump version to
 1.18.0 and convert to meson
In-Reply-To: <20200923223159.0ef09f89@windsurf>
References: <20200916194933.24921-1-ps.report@gmx.net>
 <20200916194933.24921-13-ps.report@gmx.net>
 <20200923223159.0ef09f89@windsurf>
Message-ID: <20200924221701.46d34616@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wed, 23 Sep 2020 22:31:59 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Wed, 16 Sep 2020 21:49:33 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - change home page url to https
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> > Notes:
> >  - droped the version downgrade for the bellagio case (no meson
> >    options available), maybe needs extra testing...
>
> I think this really needs to be looked at, or we dropped bellagio,
> which hasn't seen any update since 2011. It has never been clear to me
> what bellagio is exactly: isn't the OpenMAX API supposed to be like
> OpenGL, i.e provide some HW-platform specific implementations ?

Dropping bellagio (in case no one raises one hand to keep support for it)
is fine with me (but I am no OpenMAX user)...

The other specific targets are rpi (already handled), tizonia and
zynqultrascaleplus...

Regards,
Peter

>
> Thomas
