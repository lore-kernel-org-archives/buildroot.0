From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 May 2013 14:31:17 +0200
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <321768C95D21724485BCE784F1BE98473EB1DA3C@DBDE04.ent.ti.com>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
 <20130114120416.42b34d77@skate>
 <1361247529229-40702.post@n4.nabble.com>
 <20130219162959.34295207@skate>
 <1369020695818-45544.post@n4.nabble.com>
 <321768C95D21724485BCE784F1BE98473EB1D960@DBDE04.ent.ti.com>
 <20130522141715.70be80c2@skate>
 <321768C95D21724485BCE784F1BE98473EB1DA3C@DBDE04.ent.ti.com>
Message-ID: <20130522143117.02a92237@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear prabindh,

On Wed, 22 May 2013 05:23:08 -0700 (PDT), prabindh wrote:

> So after the driver package is rebuilt (and hosted somewhere), he can
> use this to create the recipe ? That would be good.

I'm not sure to follow you here. The necessary drivers and libraries to
enable OpenGL on OMAP are already available. So what Spenser will work
on is creating recipes for those software components, so that Buildroot
users can easily get OpenGL support on OMAP platforms.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
