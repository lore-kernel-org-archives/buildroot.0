From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 8 Apr 2020 23:43:37 +0300
Subject: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.28.0
In-Reply-To: <20200408221400.77fa70f2@windsurf.home>
References: <20200408152703.1360075-1-aperez@igalia.com>
 <87v9m9hibr.fsf@dell.be.48ers.dk> <20200408221400.77fa70f2@windsurf.home>
Message-ID: <20200408234337.GB231347@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 Apr 2020 22:14:00 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> On Wed, 08 Apr 2020 21:46:00 +0200
> Peter Korsgaard <peter@korsgaard.com> wrote:
> 
> > >>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:  
> > 
> >  > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>  
> > 
> > Again, it would be good to mark this as a security bump.
> 
> Doh, before applying, I had a look at
> https://webkitgtk.org/2020/03/10/webkitgtk2.28.0-released.html just to
> see what are the main highlights, and it doesn't even say it has
> security fixes not in 2.26.x.
> 
> Where did you see it has security fixes? Even the NEWS file doesn't say
> anything about this.

The latest WSA (which was released after 2.28.0) has the list of security
fixes: https://wpewebkit.org/security/WSA-2020-0003.html

Somehow I am conflicted about tagging a major release (the ones that change
the second version number) as security releases because in general packagers
tend to be reluctant to pick major releases even so. Sometimes we do not have
the possibility of publishing WSAs at the same time as releases, too? That
being told, I could argue that all WebKitGTK (and WPE WebKit) releases contain
security fixes?but that's some story for another day.

Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200408/4e1c1b08/attachment.asc>
