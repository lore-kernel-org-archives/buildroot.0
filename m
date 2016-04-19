From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 22:34:17 +0200
Subject: [Buildroot] [PATCHv2 3/4] Add package cbootimage
In-Reply-To: <1458227038-16383-4-git-send-email-julian@jusst.de>
References: <1458227038-16383-1-git-send-email-julian@jusst.de>
 <1458227038-16383-4-git-send-email-julian@jusst.de>
Message-ID: <20160419223417.2fd5ab92@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 17 Mar 2016 16:03:57 +0100, Julian Scheel wrote:
> Add package for cbootimage host utility that is able to compile bct files and
> generate flashable images out of a bct and an image for tegra processors.
> 
> Signed-off-by: Julian Scheel <julian@jusst.de>

The commit title should have been:

	cbootimage: new package


> +	  This project provides a tool which compiles BCT (Boot Configuration
> +	  Table) images to place into the boot flash of a Tegra-based device.

Those lines were slightly too long. You shouldn't exceed 72 chars.

I've fixed up those minor issues and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
