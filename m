From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 14:54:43 +0100
Subject: [Buildroot] How to make iptables binary for android devices
In-Reply-To: <AANLkTiknB2CoHWVH-buJuVRH5ZC3bmWu9-YVp8X+n1hW@mail.gmail.com>
References: <AANLkTiknB2CoHWVH-buJuVRH5ZC3bmWu9-YVp8X+n1hW@mail.gmail.com>
Message-ID: <20110307145443.5f5a60c0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Mar 2011 11:52:38 -0500
Preetam Bhosle <preetb123@gmail.com> wrote:

> i am trying to cross-compile iptables to work on android devices(ARM
> processor). I tried, but i couldn't do it. please explain in detail(as
> i am a beginner to this) how can i make iptables binary that will be
> installed and used on android devices.

This is out-of-topic for this list. Buildroot is an embedded Linux
build system, which produces a traditional Linux userspace, with a
traditional C library, Busybox, etc. Android has a completely custom
userspace, with a specific C library (Bionic), a specific
reimplementation of Busybox (Toolbox). This list is not the appropriate
place to ask about how to compile iptables for an ARM Android device.

> please help. i need this urgently.

Hint when working with the open-source community: never say you need
something urgently. It will just make people go away and never answer
your question.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
