From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Feb 2013 14:56:04 +0100
Subject: [Buildroot] [PATCH] New host package: sunxi-tools
In-Reply-To: <1360158308-16233-1-git-send-email-bos@je-eigen-domein.nl>
References: <1360158308-16233-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20130206145604.7ae023bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Wed,  6 Feb 2013 14:45:08 +0100, Floris Bos wrote:
> Tools for Allwinner A10 (aka sun4i) and A13 (aka sun5i) based devices.
> This includes fexc which can be used to compile .fex board definition files to
> the binary script.bin format required by the linux-sunxi kernel.
> 
> http://linux-sunxi.org/Sunxi-tools
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

I think it should be noted somewhere that those tools are needed for the
non-mainline Linux kernel for Allwinner SoCs, which has chosen to use
completely non-standard mechanisms for board definition files and
pinmuxing description. The mainline Linux effort does not require those
specific tools.

This should probably at least clearly be mentioned in the help text of
the package option.

Thanks !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
