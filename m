From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Oct 2020 14:27:57 +0200
Subject: [Buildroot] [PATCH] package/keepalived: make suport for Linux
 headers >= 3.2
In-Reply-To: <20201016122240.4235-1-vadim4j@gmail.com>
References: <20201016122240.4235-1-vadim4j@gmail.com>
Message-ID: <20201016142757.1849f560@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadym,

On Fri, 16 Oct 2020 15:22:40 +0300
Vadym Kochan <vadim4j@gmail.com> wrote:

> From: Vadym Kochan <vadym.kochan@plvision.eu>
> 
> There are some toolchains which is compiled with Linux 3.2 heaers, it
> would good to support them too because the package bulds fine with them.
> 
> Signed-off-by: Vadym Kochan <vadym.kochan@plvision.eu>

Have you looked at commit d01b0bbad04b97a5e8e1dd3ac3c1026555f793fb,
which added this headers >= 3.4 dependency ?

Was the kernel headers check in keepalived mentioned in the commit log
fixed later on ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
