From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 23:10:09 +0100
Subject: [Buildroot] [PATCH v2 1/4] configs: atmel: unify and update
 defconfig for Xplained boards
In-Reply-To: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
References: <1458830564-27350-1-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20160324231009.294b4b91@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 15:42:41 +0100, Ludovic Desroches wrote:
> Unify and update the defconfig files for Atmel Xplained boards:
> - use at91bootstrap as first stage bootloader instead of u-boot spl
> - build all dtb variants
> - bump to linux4sam_5.2
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
