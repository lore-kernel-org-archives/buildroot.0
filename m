From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 10 Nov 2016 11:54:09 +0200
Subject: [Buildroot] [PATCH] configs: atmel: sama5d4ek removal
In-Reply-To: <20161110084927.13293-1-ludovic.desroches@atmel.com>
References: <20161110084927.13293-1-ludovic.desroches@atmel.com>
Message-ID: <20161110095409.y25d3vkzeebozw2j@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ludovic,

On Thu, Nov 10, 2016 at 09:49:27AM +0100, Ludovic Desroches wrote:
> The Atmel sama5d4ek board is no longer sold. Since there is the Xplained
> board and we won't maintain anymore the EK board, the defconfig can be
> removed.

Please remove mention of this defconfig from board/atmel/readme.txt as well.

> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>  configs/atmel_sama5d4ek_defconfig | 30 ------------------------------
>  1 file changed, 30 deletions(-)
>  delete mode 100644 configs/atmel_sama5d4ek_defconfig

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
