From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 6 Oct 2018 17:05:00 +0200
Subject: [Buildroot] [PATCH 19/23] python-passlib: new package
In-Reply-To: <20181004135035.7a4562d1@windsurf>
References: <20180926153505.3411-1-asafka7@gmail.com>
 <20180926153505.3411-20-asafka7@gmail.com>
 <20181004135035.7a4562d1@windsurf>
Message-ID: <CAGm1_ktu91FagKC2-Mn3dz1CEEcCk4vrvx-WxuQZvrV6eb8XJg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Oct 4, 2018 at 1:50 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 26 Sep 2018 18:35:01 +0300, Asaf Kahlon wrote:
>
> > +PYTHON_PASSLIB_LICENSE = BSD
>
> This is not a valid SPDX license tag, it should have been BSD-3-Clause.
> Perhaps this should be fixed in scanpypi, so that it emits a warning
> about the license being imprecise ?

Put this on my TODO list.

Yegor

> I fixed that up, added Yegor Reviewed-by, and applied. Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
