From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 27 May 2019 12:29:28 +0200
Subject: [Buildroot] [PATCH/next v2 1/3] package/wpebackend-fdo: bump to
 version 1.2.0
In-Reply-To: <20190526143557.2b6b1c3d@windsurf>
References: <20190514114111.20424-1-aperez@igalia.com>
 <20190520214037.58011-1-aperez@igalia.com>
 <20190520214037.58011-2-aperez@igalia.com>	<20190526143557.2b6b1c3d@windsurf>
Message-ID: <20190527122928.GB5037@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 May 2019 14:35:57 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Tue, 21 May 2019 00:40:35 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > WPE WebKit 2.24.x requires WPEBackend-fdo 1.2.x, as indicated at:
> > 
> >   https://wpewebkit.org/release/schedule/#compatible-components
> > 
> > The added patch makes the build system pick the version of
> > wayland-scanner from $(HOST_DIR), instead of the target version.
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> > Changes v1 -> v2:
> >   - Included upstream patch which solves picking the correct (host)
> >     version of wayland-scanner.
> 
> Series applied to next. Thanks!

Awesome \o/

Soon I'll be able to kill the BR2_EXTERNAL that some people have been using
now and then... or better, use it as a place to keep our defconfigs and
experiments.

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190527/61f970c1/attachment.asc>
