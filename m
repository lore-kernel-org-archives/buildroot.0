From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat, 20 Sep 2014 00:25:04 +0200
Subject: [Buildroot] Outcome of the GSoC 2014
In-Reply-To: <20140915231601.7a362d01@free-electrons.com>
References: <20140915214402.05faf4fd@free-electrons.com>
 <20140915211348.GC8072@ned>
 <20140915231601.7a362d01@free-electrons.com>
Message-ID: <20140919222504.GA19421@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 15, 2014 at 11:16:01PM +0200, Thomas Petazzoni wrote:
> Eric,
>
> On Mon, 15 Sep 2014 23:13:48 +0200, Eric Le Bihan wrote:
>
> > > We also have a few patches pending in patchwork from Hadrien, that
> > > need adopters:
> > >
> > >  * libgtk3: new package
> > >    http://patchwork.ozlabs.org/patch/375493/
> > >
> > >    This one is almost ready, there are still a few fixes to be made. I
> > >    know Eric Le Bihan has also worked on libgtk3. Maybe Eric you could
> > >    take over this effort?
> >
> > I will adopt this patch.
>
> Awesome, thanks a lot!

I have reworked the patch:

- introduction of pkg-config-native in host-pkgconf.
- addition of a dependency on host-pkgconf to host-libgtk3.
- addition of multiple backend support (X11/Wayland/Broadway) in libgtk3.

When one adopts a patch, how should the credits be edited? Do I keep the
original author of the patch in the commit log and add myself in a
"Signed-off-by" line with some comments, or vice-versa?

Best regards,
ELB
