From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 May 2015 19:17:43 +0200
Subject: [Buildroot] [PATCH 2/2] rpi-firmware: modify settings for Pi 2
In-Reply-To: <1430579415-22802-2-git-send-email-bos@je-eigen-domein.nl>
References: <1430579415-22802-1-git-send-email-bos@je-eigen-domein.nl>
 <1430579415-22802-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20150502191743.66ea584f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Sat,  2 May 2015 17:10:14 +0200, Floris Bos wrote:
> Remove low-level settings from config.txt like arm_freq and sdram_freq.
> The defaults should be good for most and differ by Pi model.
> E.g. the Pi 2 runs at 900 Mhz by default, setting arm_freq=700
> like we had previously would underclock it.
> 
> Add short description in comments to options.
> Mention initramfs option.
> 
> Remove obsolete options from cmdline.txt
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>
> ---
>  package/rpi-firmware/cmdline.txt |  2 +-
>  package/rpi-firmware/config.txt  | 14 ++++++++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
