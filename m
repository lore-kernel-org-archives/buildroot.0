From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 13:21:01 +0200
Subject: [Buildroot] Running Weston on stm32mp157c-dk2
In-Reply-To: <CAOiXNkDBjvTj=ND=qVvaz+vk2H8LBiE3dm0HCFK=9a+Y8NBf1A@mail.gmail.com>
References: <CAOiXNkAuzbY-8VLckB71VgamhH9i80CK3TX0TGLLj0z_0iTygQ@mail.gmail.com>
 <20200909221101.327887ca@windsurf.hq.k.grp>
 <CAOiXNkAW-_HZPMGzZSezjNDu=wyKN6eiiokfOXBkBaAce+SMLg@mail.gmail.com>
 <20200910114133.43bb3e53@windsurf.hq.k.grp>
 <CAOiXNkCVYCW=rf6pN5-e0D7NZWhoOry0ZwtPDEOPna_4G2ss6g@mail.gmail.com>
 <CAOiXNkDBjvTj=ND=qVvaz+vk2H8LBiE3dm0HCFK=9a+Y8NBf1A@mail.gmail.com>
Message-ID: <20200914132101.536ed541@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 14 Sep 2020 11:10:41 +0200
Andrey Nechypurenko <andreynech@gmail.com> wrote:

> Selecting the gcnano-binaries package leads to the following compile errors.
> This time "make clean" does not help unfortunately :-) .
> If someone has an idea how to fix these errors, I would appreciate the hint.

Which Linux kernel are you using ?

Indeed, the gcnano-binaries kernel module is tested by ST to work with
the ST-provided kernel.

However, Buildroot's stm32mp157c_dk2_defconfig uses the upstream Linux
kernel. With some effort, it should be possible to get the
gcnano-binaries kernel module to build/work with the upstream kernel,
but I'm not too surprised it is not "immediate".

Otherwise, you can switch to the ST-provided kernel.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
