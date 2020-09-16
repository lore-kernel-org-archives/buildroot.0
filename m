From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Sep 2020 08:53:14 +0200
Subject: [Buildroot] [PATCH 1/3] support/scripts/mkusers: allow option
 for system uid/gid
In-Reply-To: <CADYdroMULeB=so8q27z1PfK2yFh+myhBV_Dm6+5+AJzqKFDhQA@mail.gmail.com>
References: <20200113153516.486106-1-nolange79@gmail.com>
 <20200915224701.5f096d97@windsurf.hq.k.grp>
 <CADYdroMULeB=so8q27z1PfK2yFh+myhBV_Dm6+5+AJzqKFDhQA@mail.gmail.com>
Message-ID: <20200916085314.3b7122b7@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Sep 2020 23:29:24 +0200
Norbert Lange <nolange79@gmail.com> wrote:

> Yeah, this was touched upon (both points), see [1].
> 
> System users exist as concept on all distros an observable effects are for
> ex journald spawning a separate logging stream.

Right, thanks for the additional feedback.

> So no, it's not just cosmetics, and yes I'd make system user the default.

Agreed.

Did you compare your implementation with the one proposed by Stephan
earlier ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
