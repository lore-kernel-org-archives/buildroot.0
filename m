From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:09:44 +0100
Subject: [Buildroot] [PATCH] system/Config.in: hide
 BR2_TARGET_GENERIC_GETTY_{TERM, OPTIONS} with systemd
In-Reply-To: <20180112173953.GC3226@scaer>
References: <20180110221402.19743-1-thomas.petazzoni@free-electrons.com>
 <20180111173104.GB3559@scaer>
 <20180112100216.36d494c1@windsurf.lan>
 <20180112173953.GC3226@scaer>
Message-ID: <20180112220944.2e8538a3@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 18:39:53 +0100, Yann E. MORIN wrote:

> Then change the title and commit to something like:
> 
>     system: only expose getty option for busybox and sysvinit
> 
>     Only busybox and sysvinit handle those options; the other init
>     systems do not.
> 
>     So, protect those options behind appropriate dependencies on
>     busybox or sysvinit.
> 
>     Fixes #10301.
> 
> And then you can add my:
> 
>     Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

ACK, thanks for the feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
