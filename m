From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:26:20 +0200
Subject: [Buildroot] [PATCH] qt5base: remove use of QT5BASE_EXTRA_CFLAGS
In-Reply-To: <1522881016-6423-1-git-send-email-joshua.henderson@microchip.com>
References: <1522881016-6423-1-git-send-email-joshua.henderson@microchip.com>
Message-ID: <20180409112620.3ff22abd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 4 Apr 2018 15:30:16 -0700, Joshua Henderson wrote:
> This variable was added as part of an EGL i.MX6 workaround in commit
> (7e9f459adf), but appears to currently be abandonded and unused.  Remove the use
> of the variable.
> 
> Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>
> ---
>  package/qt5/qt5base/qt5base.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
