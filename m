From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Wed, 22 Feb 2017 16:11:24 +0100
Subject: [Buildroot] GObject introspection
In-Reply-To: <20170221154220.obb3u3t2edwnzbux@tarshish>
References: <20170221111505.n57qgjfzkfynlesw@tarshish>
 <e4a16f6891f6c1215cfb87b5743762b1@zacarias.com.ar>
 <20170221154220.obb3u3t2edwnzbux@tarshish>
Message-ID: <1502654.pABbHeZYPZ@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tuesday 21 February 2017 17:42:20 CET Baruch Siach wrote:
> Hi Gustavo,
> 
> On Tue, Feb 21, 2017 at 09:26:40AM -0300, Gustavo Zacarias wrote:
> > On 2017-02-21 08:15, Baruch Siach wrote:
> > > GObject introspection[1] is not currently packaged for Buildroot. Quite a 
> > > few packages disable introspection support at build time. If fact, we go
> > > into great trouble to disable introspection in libgtk3. Is there a reason 
> > > why we don't package GObject introspection other than "nobody felt the 
> > > need"? Does introspection require special build time handling?
> > > 
> > > My goal is to package pydbus[2] that depends on a newer version of
> > > python-gobject (latest is 3.22, we currently package 2.28), which in
> > > turn depends on GObject introspection.
> > > 
> > > The current Buildroot option for dbus Python binding is dbus-python, but
> > > it is based on dbus-glib which is "obsolete and unmaintained"[3].
> > > 
> > > Any other option or suggestion?
> > > 
> > > [1] https://wiki.gnome.org/Projects/GObjectIntrospection
> > > 
> > > [2] https://github.com/LEW21/pydbus
> > > 
> > > [3] https://www.freedesktop.org/wiki/Software/DBusBindings/
> > 
> > Last time i checked introspection required some nasty tricks to cross
> > compile.
> > Just google around and you might find an update.
> > I have/had some WIP somewhere, just need to see if that work is still
> > relevant, but first i need to find it :)
> > But other than "it needs some trickery" i see no other reason to avoid it.
> 
> Thanks. This is quite tricky indeed. Let me know if you find anything.

If you are Yocto fluent, you can check:

  http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-gnome/gobject-introspection


Regards,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
