From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jun 2017 21:21:53 +0200
Subject: [Buildroot] [PATCH V2 1/1] Arcturus uCLS1012A-SOM support
In-Reply-To: <8ae51e44-2951-9551-3b07-31e1cf942dbd@arcturusnetworks.com>
References: <20170607185010.4652-1-oleks@arcturusnetworks.com>
 <20170608140624.74726acf@free-electrons.com>
 <8ae51e44-2951-9551-3b07-31e1cf942dbd@arcturusnetworks.com>
Message-ID: <20170608212153.4e67c8af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 8 Jun 2017 12:14:13 -0400, Oleksandr G Zhadan wrote:

> Looks like I can correct all things you pointed to, except last one:
> My personal preferences as well is to build toolchains from the sources 
> and we already tried to do it , but, from our experience, in situation 
> with aarch64 ls1012a support to generate "correct code" we MUST use 
> EXTERNAL toolchain from Linaro

What is the problem that you encounter with the Buildroot generated
toolchain? It should definitely work, and if it doesn't, we have a
serious problem.

At least, we know it builds a toolchain capable of building a kernel +
userspace that boots under Qemu.

> (and BTW this one is the first/default  choice for aarch64).

No: the default for AArch64 is an internal Buildroot toolchain.

> And one question:
> When I will change the commit title should I send it as a new commit or 
> as v3 of my previous patches ?

A v3 of your previous patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
