From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Feb 2017 22:14:44 +0100
Subject: [Buildroot] [PATCH v3 3/3] qt5base: make harfbuzz support
 selectable
In-Reply-To: <20170220220434.728a8a89@free-electrons.com>
References: <20170218113202.14213-1-ps.report@gmx.net>
 <20170218113202.14213-3-ps.report@gmx.net>
 <20170220220434.728a8a89@free-electrons.com>
Message-ID: <20170220221444.4792d09a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 20 Feb 2017 22:04:34 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sat, 18 Feb 2017 12:32:02 +0100, Peter Seiderer wrote:
> > If selected use:
> > 
> >  - system/buildroot harfbuzz in case __sync for 4 bytes is supported
> >  - qt harfbuzz otherwise (using QAtomic instead)
> > 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> 
> From this description, it is not clear whether this is material for
> master or for next. What happens currently with Harfbuzz? Qt is always
> using its internal version?

This patch is a follow up on your (and Arnout's) suggestion to prefer
system libraries, freetype first, harzbuzz second..., so logically it
belongs to the freetype patch...

But no mandatory need for this patch to be applied to master, maybe
next is enough...

At the moment always the qt built-in harfbuzz is used...

Regards,
Peter

> 
> Thomas
