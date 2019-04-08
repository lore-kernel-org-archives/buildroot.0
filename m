From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:56:17 +0200
Subject: [Buildroot] [PATCH] linux: simplify LINUX_BUILD_CMDS
In-Reply-To: <20190408204832.GD23890@scaer>
References: <20190408202136.22944-1-thomas.petazzoni@bootlin.com>
 <20190408204832.GD23890@scaer>
Message-ID: <20190408225617.645b9257@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 8 Apr 2019 22:48:32 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Isn't the image name either:
>   - implicit for the architecture, or
>   - specified as a config option in the linux configuration?

Nope. At least on ARM, what gets built by default is a zImage, but some
people might want a uImage, and that isn't specified by the kernel
configuration.

Ditto for many other architectures: the kernel image type is rarely
defined by the kernel configuration.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
