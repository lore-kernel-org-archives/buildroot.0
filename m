From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 11:13:21 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual: document meson-based
 packages
In-Reply-To: <20160717163724.GN3614@free.fr>
References: <1468072147-17509-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1468072147-17509-3-git-send-email-eric.le.bihan.dev@free.fr>
 <20160717163724.GN3614@free.fr>
Message-ID: <20160718111321.40fc5ee8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 18:37:24 +0200, Yann E. MORIN wrote:

> > +Buildroot does not (yet) provide a dedicated package infrastructure for
> > +meson-based packages.  
> 
> So why not provide one? A new infra is not trivial to write, indeed, but
> given your example, the meson-package does not look like it is a complex
> one to write (see below).
> 
> However, considering that we have no package that use meson yet, and
> that you do not plan on sending one shortly, what's the point in having
> either an infra or even this documentation?

I prefer to have an infrastructure once we have a few packages that
actually use meson. Until it is the case, I prefer to not have a
package infrastructure for this, especially since using generic-package
for Meson packages remains pretty simple, according to Eric's
documentation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
