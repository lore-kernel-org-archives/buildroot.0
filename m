From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Sep 2014 13:11:30 +0200
Subject: [Buildroot] Outcome of the GSoC 2014
In-Reply-To: <20140919222504.GA19421@itchy>
References: <20140915214402.05faf4fd@free-electrons.com>
 <20140915211348.GC8072@ned>
 <20140915231601.7a362d01@free-electrons.com>
 <20140919222504.GA19421@itchy>
Message-ID: <20140920131130.1cab6f32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sat, 20 Sep 2014 00:25:04 +0200, Eric Le Bihan wrote:

> I have reworked the patch:
> 
> - introduction of pkg-config-native in host-pkgconf.
> - addition of a dependency on host-pkgconf to host-libgtk3.
> - addition of multiple backend support (X11/Wayland/Broadway) in libgtk3.

Looks good. Make sure to have a separate patch for pkg-config-native.

> When one adopts a patch, how should the credits be edited? Do I keep the
> original author of the patch in the commit log and add myself in a
> "Signed-off-by" line with some comments, or vice-versa?

Normally, you keep the original author as the author of the patch, add
a new SoB line with your name, and do something like:

[Eric: added this, and that, etc.]

To indicate the changes you've made to the original patch.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
