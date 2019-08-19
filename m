From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 19 Aug 2019 17:23:47 +0300
Subject: [Buildroot] [PATCH 1/1] package/wpebackend-fdo: bump to version
 1.2.2
In-Reply-To: <20190819155935.136ade6a@windsurf.home>
References: <20190819121058.26798-1-aperez@igalia.com>
 <20190819155935.136ade6a@windsurf.home>
Message-ID: <20190819172347.GB27677@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Aug 2019 15:59:35 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello Adrian,
> 
> On Mon, 19 Aug 2019 15:10:58 +0300
> Adrian Perez de Castro <aperez@igalia.com> wrote:
> 
> > This is a bugfix release which solves an underlinking issue, which would
> > prevent building in some situations (for example, when --no-undefined is
> > passed to the linker). Release notes:
> > 
> >   https://wpewebkit.org/release/wpebackend-fdo-1.2.2.html
> > 
> > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> > ---
> >  package/wpebackend-fdo/wpebackend-fdo.hash | 8 ++++----
> >  package/wpebackend-fdo/wpebackend-fdo.mk   | 2 +-
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> Here as well, it's a single simple commit that fixes some potential
> build issues, so I've applied to master, even though it's a version
> bump.

Right, I forgot to mention that this was exactly the intention, because
of the small amount of changes. Thanks for merging them both!

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190819/4955a9be/attachment.asc>
