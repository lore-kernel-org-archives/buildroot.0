From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 Feb 2013 14:34:18 +0200
Subject: [Buildroot] Buildroot at ELC: review/suggestions needed
In-Reply-To: <20130214104622.1e6c88e1@skate>
References: <20130209195709.323b9f5e@skate> <20130213231346.0ed68b45@skate>
 <20130214104622.1e6c88e1@skate>
Message-ID: <20130214123416.GE15440@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Feb 14, 2013 at 10:46:22AM +0100, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 13 Feb 2013 23:13:46 +0100, Thomas Petazzoni wrote:
> 
> > The current state of the slides is visible at
> > http://free-electrons.com/~thomas/pub/buildroot-slides.pdf.
> 
> I've updated the slides to take into account the comments I've
> received, and added a bit more contents (popular boards supported, list
> of architectures, Eclipse plug-in). They are available at the same
> location.

Now "Linux" appears twice in slide 7/13. Maybe this should be changed to 
"Linux kernel" (once).

If space allows it may be worth to split the list into categories, say:

Toolchains:
    glibc / uclibc / ...

Bootloaders:
    uboot, Barebox

Kernel:
    Linux

Graphics:
    X.org, Qt, Gtk

Networking:
    connman, ...

Scripting:
    Perl, Python, PHP, Lua

But I'm not sure this long list fits in a single slide.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
