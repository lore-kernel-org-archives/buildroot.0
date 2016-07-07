From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2016 21:31:43 +0200
Subject: [Buildroot] Interesting circular dependency, how to solve?
In-Reply-To: <20160707163322.GA3827@free.fr>
References: <20160706175617.67b0e1ea@free-electrons.com>
 <20160707163322.GA3827@free.fr>
Message-ID: <20160707213143.37841dd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 7 Jul 2016 18:33:22 +0200, Yann E. MORIN wrote:

> Maybe we could have some autobuilders use our defconfigs as starting
> points for randpackageconfig? Most (all?) of our defconfigs have a
> kernel enabled, so we could probably catch such a situation...

My idea for this topic is more something like randomly, enabling the
Linux kernel package and depending on the selected architecture, use a
given defconfig (with a table of architecture <-> defconfig) match in
the autobuild-run script.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
