From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 02 May 2018 21:12:54 +0000
Subject: [Buildroot] [PATCH v5 2/9] gst1-plugins-${base, good, bad,
 ugly}: bump to 1.14.0
In-Reply-To: <20180501224907.14e84163@windsurf.home>
References: <20180501134651.8876-1-aduskett@gmail.com>
 <20180501134651.8876-2-aduskett@gmail.com>
 <20180501224907.14e84163@windsurf.home>
Message-ID: <CAFSsvmqjoFRCCC5+w3f9X7HCOATyFhWCE2tzL4Xpi2kB=f04Sw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas; all
On Tue, May 1, 2018 at 4:49 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Adam,

> On Tue,  1 May 2018 09:46:44 -0400, Adam Duskett wrote:
> > These are grouped together because several plugins have been
re-arranged and
> > there is no way to individually update each plugin package.
> >
> > Changes:
> >
> > Add the following to gst1-plugins-base and remove them from plugins-bad:
> >  - opengl
> >  - gles2
> >  - glx
> >  - egl
> >  - x11
> >  - dispmanx
> >  - audiomixer
> >
> > Add the following to plugins-good and remove them from plugins-ugly:
> >  - lame
> >  - mpg123
> >
> > moved --disable-qt from plugins-bad to plugins-good
> >
> > Also add hashes for the license files.
> >
> > Signed-off-by: Adam Duskett <aduskett@gmail.com>

> There are two issues with this patch:

>   - You remove/rename a lot of options, but there is no Config.in.legacy
>     handling for the options being removed/renamed.

>   - The lame and mpg123 support is moved from plugins-ugly to
>     plugins-good, but the corresponding options are not removed from
>     plugins-ugly/Config.in.

> Could you fix those issues, re-adjust the authorship for PATCH
> 8/9 (you can do that with git commit --amend --author="..."), and send
> an updated version of this patch series ?

> Thanks!

> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
I am going to have to decline. I really don't want to sit here through
possibly several more revisions of the patch series.
I have marked the series as rejected and anybody else is free to resubmit
if they want.

Thanks

Adam
