From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 May 2015 21:05:58 +0200
Subject: [Buildroot] showstopper 404 problem ...
In-Reply-To: <01a201d0971b$fca690b0$f5f3b210$@novadsp.com>
References: <01a201d0971b$fca690b0$f5f3b210$@novadsp.com>
Message-ID: <20150525210558.39e88c66@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 May 2015 19:52:44 +0100, g4 at novadsp.com wrote:

> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="4.0.4"
> 
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.ti.com/ti-linux-kernel/ti-linux-
> kernel.git"

As explained by Yegor, use the mainline kernel, not TI's fork.


> fatal: Not a valid object name

This means there is no 4.0.4 tag in the Git kernel tree you're pointing
to.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
