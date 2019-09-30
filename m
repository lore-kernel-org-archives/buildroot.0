From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 30 Sep 2019 11:38:46 +0300
Subject: [Buildroot] [PATCH 1/4] package/libwpe: bump to version 1.4.0
In-Reply-To: <20190928233148.23c8a78c@windsurf>
References: <20190920213826.2531495-1-aperez@igalia.com>
 <20190920213826.2531495-2-aperez@igalia.com>
 <20190928233148.23c8a78c@windsurf>
Message-ID: <20190930113846.GC242161@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Sep 2019 23:31:48 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Sat, 21 Sep 2019 00:38:23 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > WPE WebKit 2.26.0 requires libwpe 1.4.x, as indicated at:
> > 
> >   https://wpewebkit.org/release/schedule/#compatible-components
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/libwpe/libwpe.hash | 8 ++++----
> >  package/libwpe/libwpe.mk   | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
> > index c46e205dcf..91332ca51f 100644
> > --- a/package/libwpe/libwpe.hash
> > +++ b/package/libwpe/libwpe.hash
> > @@ -1,7 +1,7 @@
> > -# From https://wpewebkit.org/releases/libwpe-1.2.1.tar.xz.sums
> > -md5 9f26865f06ecf933ddbbf067a7be735f libwpe-1.2.1.tar.xz
> > -sha1 d3f6211a2acafe1bd1f41e826c8efae35335fc92 libwpe-1.2.1.tar.xz
> > -sha256 00e103c6fa226b0d979c29d14c9e8168c4bec7b0b5108f3705a037cda5609d7d libwpe-1.2.1.tar.xz
> > +# From https://wpewebkit.org/releases/libwpe-1.4.0.tar.xz.sums
> > +md5 4b6dbaa2d40408975fe1be935367b4e8 libwpe-1.4.0.tar.xz
> > +sha1 18825932749edecd92a3bd31d4feffb5fd1150b4 libwpe-1.4.0.tar.xz
> > +sha256 e2d3494fc33fe946ad917fd6a3abd127462b91bba62ef8b35507e92f8ede4188 libwpe-1.4.0.tar.xz
> >  
> >  # Hashes for license files:
> >  sha256 6efc9991641b47b1f4e727db7f090d0ade00117dcbbc74be622f2baceddb1f22 COPYING
> 
> You forgot to update the hash of the license file, which has changed
> with this update. That was breaking "make legal-info". I fixed that and
> updated the commit log to give some details about why the license file
> has changed. Applied with this fix!

/me facepalms

Good catch, thanks for taking care of it.

?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190930/d20648d0/attachment-0001.asc>
