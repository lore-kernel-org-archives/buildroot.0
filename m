From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Oct 2014 17:10:15 +0200
Subject: [Buildroot] [PATCH] defconfigs: add sama5d3 support
In-Reply-To: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
References: <1391093726-7569-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20141006171015.6c1b0cb5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ludovic,

On Thu, 30 Jan 2014 15:55:26 +0100, ludovic.desroches at atmel.com wrote:
> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> Defconfig file for boards based on sama5d3x devices.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>

Since you posted your patch, we have merged a defconfig for the SAMA5D3
Xplained board that matches the "requirements" of Buildroot in terms of
defconfig. See
http://git.buildroot.net/buildroot/commit/?id=54a653f649d131f8a038fc1314383b60294ad351.

So I'll mark your patch as Rejected in our patch tracking system.

Of course, feel free to send a new patch if you disagree with this
decision.

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
