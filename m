From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 15 Jul 2016 10:00:45 -0300
Subject: [Buildroot] [PATCH] configs: new configuration for i.MX6UL Pico
	board
In-Reply-To: <20160531221650.385eccad@free-electrons.com>
References: <1463601264-16293-1-git-send-email-festevam@gmail.com>
 <20160531221650.385eccad@free-electrons.com>
Message-ID: <CAOMZO5B-PeCvDQ9C7Hsya9pSVxtsj6NbT7xWV_QzQbW1AXLa6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, May 31, 2016 at 5:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 18 May 2016 16:54:24 -0300, Fabio Estevam wrote:
>> Add support for Technexion's i.MX6UL Pico board.
>>
>> For information about this board, please visit:
>> http://www.wandboard.org/images/hobbit/hobbitboard-imx6ul-reva1.pdf
>>
>> Currently two patches are needed, but in the future they can be removed
>> when we switch to kernel 4.7 and U-boot 2016.07 versions.
>>
>> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>
> This generally looks good, but we generally like when a readme.txt is
> added to indicate how to quickly setup the board to use the Buildroot
> image.

Thanks for the review. I will send v2 including the readme file.

I will wait for 4.7 kernel to be released this weekend, so that I
don't have to carry the extra dts patch anymore.

Will also bump U-boot to 2016.07.

Regards,

Fabio Estevam
