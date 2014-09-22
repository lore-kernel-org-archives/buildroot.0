From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:02:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg: Enable armv6 support
 for Cortex cores
In-Reply-To: <1411399036-11888-1-git-send-email-bernd.kuhls@t-online.de>
References: <1411399036-11888-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140922190225.01c57ae0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Mon, 22 Sep 2014 17:17:15 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/cda/cdad51f610c339d2ad4c7d09c282cfb4b10770a0/
> http://autobuild.buildroot.net/results/cd5/cd53af973d9722481c3298f484b399c9a2c286cf/
> http://autobuild.buildroot.net/results/a9a/a9a2c49d923fd891945a24c9d0d147b3eea9b037/
> http://autobuild.buildroot.net/results/d2f/d2f51632aea5727df9404e611e8e379567f03b61/
> http://autobuild.buildroot.net/results/a62/a622dd113dcb7b352bcfebe3b3c7ac6ed286d7c7/
> http://autobuild.buildroot.net/results/2ea/2eace18d0d32b4cbb6120b06d2bbe79d2b9857a7/
> http://autobuild.buildroot.net/results/caa/caad4172db90879db51b66625b98aa0805e39c73/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/ffmpeg/ffmpeg.mk |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Both patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
