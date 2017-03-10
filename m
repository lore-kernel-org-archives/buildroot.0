From: Floris Bos <bos@je-eigen-domein.nl>
Date: Fri, 10 Mar 2017 13:51:41 +0100
Subject: [Buildroot] [5/8] package/rpi-firmware: bump version
In-Reply-To: <1488729976-7116-5-git-send-email-martin@barkynet.com>
References: <1488729976-7116-5-git-send-email-martin@barkynet.com>
Message-ID: <f12fff71-bfbe-87cf-077a-52e2019dcc0e@je-eigen-domein.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 03/05/2017 05:06 PM, Martin Bark wrote:
> -RPI_FIRMWARE_VERSION = 7f8ac8dac0b80291cbf5e56580139034a0a42070
> +RPI_FIRMWARE_VERSION = 78c4983379de0537f49a97fb37ceaaf42632b28c

New firmware version does not get along with projects that still use 
4.4.x kernel.
It seems that projects that still use 4.4.x are now supposed to use the 
firmware branch called "stable"

Perhaps we should introduce a config option for firmware version, like 
we have for kernel version?


Yours sincerely,

Floris Bos
