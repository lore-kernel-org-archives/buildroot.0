From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 10 Sep 2020 11:41:33 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
In-Reply-To: <CAOiXNkAW-_HZPMGzZSezjNDu=wyKN6eiiokfOXBkBaAce+SMLg@mail.gmail.com>
References: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
 <20200909221101.327887ca@windsurf.hq.k.grp>
 <CAOiXNkAW-_HZPMGzZSezjNDu=wyKN6eiiokfOXBkBaAce+SMLg@mail.gmail.com>
Message-ID: <20200910114133.43bb3e53@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 10 Sep 2020 11:40:29 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> > Which OpenGL implementation are you trying to use? The proprietary
> > blobs from Vivante, or the open-source Etnaviv implementation? I don't
> > know if the latter was tested on STM32MP157.  
> 
> Good question. In fact, I am not sure :-) . So I guess it is Etnaviv
> because I did nothing to add proprietary blobs. I will check it out
> and see what is used by Yocto-based distribution provided by STM where
> Weston works.

In Buildroot, the package package/gcnano-binaries/ will give you the
proprietary OpenGL blobs provided by ST.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
