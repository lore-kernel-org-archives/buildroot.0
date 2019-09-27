From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 27 Sep 2019 16:29:04 +0200
Subject: [Buildroot] [PATCH] DEVELOPERS: add Yegor Yefremov as contact
 for BeagleBone defconfigs
In-Reply-To: <CAGm1_kuHiP2PrQnVK39X+2bH8QKZwaJzhNYEY6JWrhjjHyO0hg@mail.gmail.com>
References: <20190927085903.25001-1-yegorslists@googlemail.com>
 <CAGm1_kuHiP2PrQnVK39X+2bH8QKZwaJzhNYEY6JWrhjjHyO0hg@mail.gmail.com>
Message-ID: <20190927162904.29ab8f39@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 27 Sep 2019 13:48:10 +0200
Yegor Yefremov <yegorslists@googlemail.com> wrote:

> do you still have the hw? Could you also register yourself for this board?
> 
> Another question why do we use TI's kernel and not the vanilla one?

At least for the Qt5 defconfig, the idea was to have OpenGL support,
using the TI PowerVR drivers. I'm not sure if/how they work with the
mainline kernel.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
