From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 8 Jan 2017 09:46:39 +0100
Subject: [Buildroot] [PATCH] arch: add support for OpenRISC architecture
In-Reply-To: <f2295c57-e0cc-52d3-a708-5e4236ab3867@gmail.com>
References: <20170107084803.GA6034@waldemar-brodkorb.de>
 <f2295c57-e0cc-52d3-a708-5e4236ab3867@gmail.com>
Message-ID: <20170108084639.GW1913@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,
Romain Naour wrote,

> Hi Waldemar,
> 
> Le 07/01/2017 ? 09:48, Waldemar Brodkorb a ?crit :
> > Add a sample defconfig which can be used to create a system for Qemu.
> > Openrisc community is getting more active recently and tries
> > to add missing patches upstream to gcc/gdb.
> 
> I'm wondering if all Binutils version (2.25.1, 2.26.1 and 2.27) can be used on
> openRISC? Have you considered to use the openrisc fork [1] ?

Thanks for your feedback. Yes all binutils version are working fine,
I just double checked now. So there is no need to use the github
version for binutils. There is no Linux gdb support, yet.
You can't use gdbserver or gdb native for now.
You could use gdb to debug bare metal code.

best regards
 Waldemar 
