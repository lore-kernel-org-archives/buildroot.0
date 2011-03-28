From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2011 10:50:37 +0200
Subject: [Buildroot] [PATCH] readline: link directly against ncurses
In-Reply-To: <AANLkTinDM3AY4iA5gipkrUHEc7EoMO6-VMLOb_NpsVkG@mail.gmail.com>
References: <1300923775-13739-1-git-send-email-vapier@gentoo.org>
	<20110324194745.268213ba@surf>
	<AANLkTinDM3AY4iA5gipkrUHEc7EoMO6-VMLOb_NpsVkG@mail.gmail.com>
Message-ID: <20110328105037.3655873a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 28 Mar 2011 03:36:46 -0400
Mike Frysinger <vapier@gentoo.org> wrote:

> On Thu, Mar 24, 2011 at 2:47 PM, Thomas Petazzoni wrote:
> > On Wed, 23 Mar 2011 19:42:55 -0400 Mike Frysinger wrote:
> >> note: not really tested since external toolchain support is totally
> >> broken
> >
> > Could you elaborate ?
> 
> i'm pretty sure i pointed this out around the time it broke.  if you
> dont specify the full path, the stupid makefiles prepend garbage.

Come on Mike, just for this reason you call the external toolchain
support "totally broken" ? It's  fixed by a two-liner patch that I
acked some time ago:
http://lists.busybox.net/pipermail/buildroot/2011-March/041901.html.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
