From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jul 2015 10:45:35 +0200
Subject: [Buildroot] [PATCH v2] toolchain-external: fix gdbserver
 copying for external arc-2014.12 tools
In-Reply-To: <55A0CA2A.1010308@openwide.fr>
References: <1427271071-9541-1-git-send-email-abrodkin@synopsys.com>
 <55A0CA2A.1010308@openwide.fr>
Message-ID: <20150711104535.3b2c1bfd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 11 Jul 2015 09:47:54 +0200, Romain Naour wrote:

> Le 25/03/2015 09:11, Alexey Brodkin a ?crit :
> > Historically in pre-built ARC GNU tools gdbserver is located in
> > top-level "target-bin" folder.
> > 
> > Because of that fact if BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY is
> > selected Buildroot won't find gdbserver (it looks within
> > SYSROOT/ARCH_SYSROOT folder).
> > 
> > Simplest solution is to use TOOLCHAIN_EXTERNAL_FIXUP_CMDS where copy
> > gdbserver from "target-bin" folder into SYSROOT/usr/bin.
> 
> Since this patch, the arc 2014.12 prebuild toolchain as been marked as broken
> [1]. This patch is still needed ?

I'd say no for the moment, I'll mark the patch as Rejected for now.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
