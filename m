From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 May 2018 22:34:47 +0200
Subject: [Buildroot] [PATCH v3 1/5] arm-trusted-firmware: simplify
 release dir path
In-Reply-To: <1525364617-23633-2-git-send-email-luca@lucaceresoli.net>
References: <1525364617-23633-1-git-send-email-luca@lucaceresoli.net>
 <1525364617-23633-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20180528223447.2d588005@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 May 2018 18:23:33 +0200, Luca Ceresoli wrote:
> The path to the binary images is very long. Since we are about to make
> a larger use of it, let's use a variable to make it somewhat shorter.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> Changes v2 -> v3: none.
> Changes v1 -> v2: none.
> ---
>  boot/arm-trusted-firmware/arm-trusted-firmware.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
