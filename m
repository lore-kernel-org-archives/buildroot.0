From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 17:33:57 +0100
Subject: [Buildroot] building fbtft framebuffer drivers into buildroot.
In-Reply-To: <20141226145128.GC3982@free.fr>
References: <CAFGceHGR2k7ARYDZqK0pskkNbd6wiguLkMdZ07zpPENW+NAZxw@mail.gmail.com>
 <20141226102028.GA3982@free.fr>
 <20141226150438.08e429c2@free-electrons.com>
 <20141226145128.GC3982@free.fr>
Message-ID: <20141226173357.20986d8c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 26 Dec 2014 15:51:28 +0100, Yann E. MORIN wrote:

> But the fact is that fbtft is only an additional modules with no impact
> on the core of the kernel; it requires "patching" the kernel just
> because it wants to add a Kconfig option and a Kbuild sub-directory.
> 
> So, it would better be built as an out-of-tree module, rather than be
> handled as a kernel extension. Hence the reason I said it would not play
> well "as-is" with Buildroot.

In this case, then yes, indeed, turning it into proper out-of-tree
modules would be nicer.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
