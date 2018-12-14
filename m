From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Dec 2018 22:06:04 +0100
Subject: [Buildroot] [PATCH] linux-firmware: Install all Qlogic QED
 binaries
In-Reply-To: <20181213231532.9657-1-joel@jms.id.au>
References: <20181213231532.9657-1-joel@jms.id.au>
Message-ID: <20181214220604.2f1ff445@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Dec 2018 09:45:32 +1030, Joel Stanley wrote:
> There are various versions shipped in linux-firmware. In the past we
> decided that it was up to the developer to filter out the ones they want
> for their specific kernel version, so install them all.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  package/linux-firmware/linux-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
