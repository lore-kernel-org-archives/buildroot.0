From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 17 Oct 2014 15:57:54 +0200
Subject: [Buildroot] [PATCH 2/2 v2] package/mono: new package
In-Reply-To: <20141013224903.0bfe6d76@free-electrons.com>
References: <1413209030-8187-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141013224903.0bfe6d76@free-electrons.com>
Message-ID: <CA+TH9Vm_UAG0fgqLX87Bom8haPXNnpYUAUxVov2+bBNEr1aOdg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Sorry for all the confusion I infused in the patch.

> There's still on things that bothers me a bit: those options
> (BR2_PACKAGE_MONO_{20,40,45}) are target options, but they are in fact
> used when building host-mono, which isn't very clean. I assume it's not
> possible to have the target mono package build the runtime libraries
> using the compiler built by the host-mono package, right?

Nope. To compile mono runtime without the host I should run mono inside qemu.
Probably it's feasible, but I really don't know if it's a raccomanded way to do.

> If not, then keep things as they are today, but put a comment above the
> place where BR2_PAKCAGE_MONO_{20,40,45} is used in the .mk file
> explaining why we're using those target options for a host package.

I did it in the new patch I sent.

Thank you again for your time!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
