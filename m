From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 14:38:05 +0100
Subject: [Buildroot] [PATCH] libtirpc: fix compilation error
In-Reply-To: <20171229130333.13661-1-daggs@gmx.com>
References: <20171229130333.13661-1-daggs@gmx.com>
Message-ID: <20171229143805.7f083140@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 15:03:33 +0200, Dagg Stompler wrote:
> when compiling libtirpc, rpcgen will fail with file not found on
> netconfig.h and rpc/types.h
> adding the proper include path to the makefile fixes it.
> 
> Signed-off-by: Dagg Stompler <daggs@gmx.com>

Could you give more details about the failures? Is this fixing an
autobuilder issue? Under what conditions does this happens? Why aren't
the autobuilders seeing this problem?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
