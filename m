From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:51:59 +0200
Subject: [Buildroot] [PATCH] package/c-periphery: bump to 1.1.3
In-Reply-To: <1533649734-63668-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1533649734-63668-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180809105159.7efc5043@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Aug 2018 08:48:54 -0500, Matt Weber wrote:
> From: Sam Voss <sam.voss@rockwellcollins.com>
> 
> Specific areas of bugfixes:
> - serial: 8th bit being stripped when using parity
> - gpio: add retry loop waiting for exported gpio dir
> - i2c: update i2c supported functions query for 64-bit
> - add support for building with C++
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  package/c-periphery/c-periphery.hash | 3 ++-
>  package/c-periphery/c-periphery.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
