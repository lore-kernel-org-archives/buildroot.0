From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Mar 2018 15:33:34 +0200
Subject: [Buildroot] [PATCH 3/4] board/raspberrypi: add support for rpi3
 b+
In-Reply-To: <1521120291-15781-3-git-send-email-martin@barkynet.com>
References: <1521120291-15781-1-git-send-email-martin@barkynet.com>
 <1521120291-15781-3-git-send-email-martin@barkynet.com>
Message-ID: <20180315133334.5fxt65qbjfk24e77@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Martin,

On Thu, Mar 15, 2018 at 01:24:50PM +0000, Martin Bark wrote: 
> diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
> index 9482693..9f91581 100644
> --- a/board/raspberrypi/readme.txt
> +++ b/board/raspberrypi/readme.txt
> @@ -30,7 +30,7 @@ For model 2 B:
>  
>    $ make raspberrypi2_defconfig
>  
> -For model 3 B:
> +For model 3 B and B+:

This is quick. Have you tested on hardware?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
