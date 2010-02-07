From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Sun, 7 Feb 2010 19:46:36 +0100
Subject: [Buildroot] [PATCH 13/14] target: added BR2_KARCH option
In-Reply-To: <1265566076-10628-14-git-send-email-llandwerlin@gmail.com>
References: <1265566076-10628-1-git-send-email-llandwerlin@gmail.com>
	<1265566076-10628-14-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100207184636.GE5229@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Feb 07, 2010 at 07:07:55PM +0100, llandwerlin at gmail.com wrote:
>From: Lionel Landwerlin <llandwerlin@gmail.com>
>
>For packages building kernel modules (ie linux-fusion), it is required
>to give the ARCH=some_arch argument to make so the kernel's makefile
>are aware of the target architecture. We didn't had the value to fill
>the ARCH variable. BR2_KARCH variable is computed using the BR2_ARCH
>variable.

There is/was KERNEL_ARCH in there since ages.
