From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Nov 2018 22:39:05 +0100
Subject: [Buildroot] [PATCH 1/1] shadowsocks-libev: fix build on riscv
In-Reply-To: <20181113213043.9083-1-fontaine.fabrice@gmail.com>
References: <20181113213043.9083-1-fontaine.fabrice@gmail.com>
Message-ID: <20181113223905.7df27c79@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 22:30:43 +0100, Fabrice Fontaine wrote:
> Define _REENTRANT otherwise pthread detection will fail
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c5406206190b46e15d35d05c5ed026ee7632f5b1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks. I'm wondering if we shouldn't patch gcc instead of fixing all
packages for this issue.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
