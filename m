From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 15 Mar 2016 08:30:37 -0300
Subject: [Buildroot] [PATCH] linux-firmware: ath9k_htc - use newer
 firmware
In-Reply-To: <1458038864-1872-1-git-send-email-abrodkin@synopsys.com>
References: <1458038864-1872-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <56E7F25D.503@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/03/16 07:47, Alexey Brodkin wrote:

> Existing blobs are of version ath9k-htc 1.3.1, see
> http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/commit/?id=21a6c3e55df956dd223279627685778268ede70f
>
> These are as said in the commit are left for compatibility with older
> kernels which [older kernels] will look for blobs in the
> root of "/lib/firmware".
>
> But there're newer v1.4 blobs in ath9k_htc folder.
> And newer kernels (>=4.4) look first in that new location
> "/lib/firmware/ath9k_htc".
>
> Note that even new kernels will fall back to previous location
> if new one doesn't exist.
>
> Tested with TP-LINK TL-WN722N (has Atheros AR9271 inside).
>
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: John Keeping <john@metanate.com>
> Cc: Matt Weber <matt@thewebers.ws>
> Cc: Alex Suykov <alex.suykov@gmail.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
