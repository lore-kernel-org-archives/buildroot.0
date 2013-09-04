From: Woody Wu <narkewoody@gmail.com>
Date: Wed, 4 Sep 2013 10:40:19 +0800
Subject: [Buildroot] GTK+ for framebuffer?
In-Reply-To: <20130903133145.370bb2d4@skate>
References: <20130903100905.GA324@zuhnb712.ap.bm.net>
 <20130903133145.370bb2d4@skate>
Message-ID: <20130904024019.GA875@zuhnb712.ap.bm.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 03, 2013 at 01:31:45PM +0200, Thomas Petazzoni wrote:
> Dear Woody Wu,
> 
> On Tue, 3 Sep 2013 18:09:06 +0800, Woody Wu wrote:
> 
> > It seems buildroot already has GTK.  Does it can build GTK+ for running
> > on framebuffer (a.k.a, gtkfb)?
> 
> There used to be a DirectFB backend in Gtk, but it was always broken,
> because nobody was maintaining it (in Gtk upstream). It was causing too
> many problems in Buildroot to keep the support for such a broken
> feature, so we removed it. People interested in running Gtk on DirectFB
> should work with upstream to fix the issues and get the corresponding
> patches merged.
> 
> These days, if you want to run Gtk, you should run X.org (which can run
> on top of the framebuffer), or maybe you can explore Wayland (but I
> guess it'll require Gtk 3.x, while we only have Gtk 2.x in Buildroot
> for the moment).
> 
> Best regards,
> 
> Thomas

Hi, Thomas

Even I cannot find libgtk (neither 2.x or 3.x) in buildroot.  I enabled
a lot of options which looks like related to gtk, then I got libraries
like glib, pango, atk, etc., but just no gtk.  Where is the option to
enable it? I think I looked through all the options :(

BTW: in your opinion, GtkFB and gtk on TinyX, which one is faster?

-- 
I can't go back to yesterday - because I was a different person then
