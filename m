From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 00:04:56 +0200
Subject: [Buildroot] [PATCH v3 2/2] i2c-tools: install library and
 header to staging
In-Reply-To: <1535118847-21086-3-git-send-email-brad@nextdimension.cc>
References: <1535118847-21086-1-git-send-email-brad@nextdimension.cc>
 <1535118847-21086-3-git-send-email-brad@nextdimension.cc>
Message-ID: <20180825000456.313d8360@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 24 Aug 2018 08:54:07 -0500, Brad Love wrote:
> When the dynamic/static library of i2c-tools is enabled it is installed
> to the target destination. However, in order for external packages to
> link against it, it must also be installed to staging.
> 
> Here, the flag is set to install the package to staging. The
> INSTALL_STAGING command is included to complete the operation.
> 
> Signed-off-by: Brad Love <brad@nextdimension.cc>
> ---
> since v2:
> - regen

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
