From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:07:09 +0200
Subject: [Buildroot] [PATCH 1/1] configs/acmesystems_arietta_g25: update
 kernel and at91bootstrap3
In-Reply-To: <1474555439-3059-1-git-send-email-biagio.hkr@gmail.com>
References: <1474555439-3059-1-git-send-email-biagio.hkr@gmail.com>
Message-ID: <20160923080709.6df7cdb2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 16:43:59 +0200, Biagio Montaruli wrote:
> - configs/acmesystems_arietta_g25_128mb_defconfig,
>   configs/acmesystems_arietta_g25_256mb_defconfig :
>   update default configuration files for both 128MB and 256MB version
> 
> - board/acmesystems/arietta-g25/genimage.cfg
>   board/acmesystems/arietta-g25/post-image.sh :
>   improve 'post-image.sh' and 'genimage.cfg' used to build sdcard.img
> 
> - board/acmesystems/arietta-g25/readme.txt :
>   update documentation for Arietta G25
> 
> Signed-off-by: Biagio Montaruli <biagio.hkr@gmail.com>
> ---
>  board/acmesystems/arietta-g25/genimage.cfg      | 12 ++++-----
>  board/acmesystems/arietta-g25/post-image.sh     |  4 +--
>  board/acmesystems/arietta-g25/readme.txt        | 14 ++++++----
>  configs/acmesystems_arietta_g25_128mb_defconfig | 36 ++++++++++++++-----------
>  configs/acmesystems_arietta_g25_256mb_defconfig | 36 ++++++++++++++-----------
>  5 files changed, 58 insertions(+), 44 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
