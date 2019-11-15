From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 21:48:52 +0100
Subject: [Buildroot] [PATCH 1/1] boot/arm-trusted-firmware: add pattern
 based copy for ATF as already used for u-boot
In-Reply-To: <1573804220-8890-1-git-send-email-michael.schenk@noser.com>
References: <1573804220-8890-1-git-send-email-michael.schenk@noser.com>
Message-ID: <20191115214852.29d8309e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Nov 2019 07:51:01 +0000
Schenk Michael <michael.schenk@noser.com> wrote:

> This adds support for different platforms where the
> binaries have different extensions.
> 
> Signed-off-by: Michael Schenk <michael.schenk@noser.com>
> ---
>  boot/arm-trusted-firmware/Config.in               | 7 +++++++
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
>  2 files changed, 10 insertions(+), 1 deletion(-)

Applied to next with a slightly shorter commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
