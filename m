From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 22:26:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/lxc: fix license
In-Reply-To: <CAPi7W83p-63jxoYFpda1szKQWTr3XFgXecS9QGLZ92MxnMb5_w@mail.gmail.com>
References: <20200715190438.16497-1-fontaine.fabrice@gmail.com>
 <20200715213055.407fac8d@windsurf.home>
 <CAPi7W83p-63jxoYFpda1szKQWTr3XFgXecS9QGLZ92MxnMb5_w@mail.gmail.com>
Message-ID: <20200715222620.74f91859@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Jul 2020 21:38:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> > Has this been reported upstream ?  
> I created an issue here: https://github.com/lxc/lxc/issues/3484.

Thanks!

> > Do we have some details about what is under GPL, what is under LGPL ?  
> Yes, each file has a SPDX header since
> https://github.com/lxc/lxc/commit/cc73685dd09315b292968ee91a08a8f295376b35.
> Most of them are LGPL but some source files under tools directory are
> GPL-2.0-only.

Then it would be good to annotate in the LXC_LICENSE variable under
what license is which part.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
