From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 9 Sep 2020 22:11:01 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
In-Reply-To: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
References: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
Message-ID: <20200909221101.327887ca@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andrey,

On Wed, 9 Sep 2020 18:08:08 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> I am just wondering if anybody tried and managed to run Weston on
> stm32mp157c-dk2 using Buildroot? If yes, I would appreciate any
> details on what should be done for it.
> 
> My attempts lead me to the point where the following output comes from
> weston-launch:
> 
> # openvt -c 3 -v weston-launch -- --log=weston.log

Which OpenGL implementation are you trying to use? The proprietary
blobs from Vivante, or the open-source Etnaviv implementation? I don't
know if the latter was tested on STM32MP157.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
