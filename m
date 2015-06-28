From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 20:13:07 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <CAHkwnC_PvCceELLUyeUoM0BEq9Pg3vJQS8TDMjeWiU9kcuZQ4A@mail.gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
 <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
 <20150615111757.03ec0b48@free-electrons.com>
 <5581FE10.8090103@mind.be>
 <CAHkwnC_PvCceELLUyeUoM0BEq9Pg3vJQS8TDMjeWiU9kcuZQ4A@mail.gmail.com>
Message-ID: <20150628201307.31ec614c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun, 28 Jun 2015 17:36:14 +0200, Fabio Porcedda wrote:

> >  That starts to smell more and more like NixOS... I.e., too complicated for
> > buildroot. But if someone proposes a patch and its diffstat looks acceptable,
> > the option is of course still open.
> 
> Maybe at least initially can be solved using an external script that
> prepare the system and launch buildroot inside the chroot.

The point is not to launch Buildroot instead the chroot, but to have
each package being built independently in the chroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
