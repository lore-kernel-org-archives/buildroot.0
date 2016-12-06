From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 6 Dec 2016 07:18:47 +0200
Subject: [Buildroot] [PATCH v2] raspberrypi-usbboot: new package
In-Reply-To: <1480971546-6460-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1480971546-6460-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20161206051847.x3g3revi2oaqdkpj@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Dec 05, 2016 at 09:59:06PM +0100, Thomas Petazzoni wrote:
> This new package currently installs the "rpiboot" utility, which is
> needed to access via USB mass storage the built-in eMMC of Raspberry Pi
> compute modules.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> Changes since v1:
>  - Use the separate https://github.com/raspberrypi/usbboot repository,
>    which contains just the rpiboot tool, and which according to
>    https://github.com/raspberrypi/tools/issues/71 is not the official
>    upstream.

s/not/now/?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
