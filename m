From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 20 Jun 2017 08:00:04 +0530
Subject: [Buildroot] [PATCH v4 2/6] board: engicam: Rename defconfig
	engicam_imx6qdl_icore_mmc_defconfig
In-Reply-To: <20170619221927.0986c336@windsurf.home>
References: <1497857252-8308-1-git-send-email-jteki@openedev.com>
 <1497857252-8308-3-git-send-email-jteki@openedev.com>
 <20170619221927.0986c336@windsurf.home>
Message-ID: <CAMty3ZC-u57FFXdjWwrbp6Hrw-rHTD9NLUQHp+igGmF4EGDfOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 20, 2017 at 1:49 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 19 Jun 2017 12:57:28 +0530, Jagan Teki wrote:
>> From: Jagan Teki <jagan@amarulasolutions.com>
>>
>> Since the board have support for nand, better to explicitly
>> name it with mmc.
>>
>> engicam_imx6qdl_icore_defconfig => engicam_imx6qdl_icore_mmc_defconfig
>>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Unless we are going to introduce other configurations for the same
> board (to support NAND booting), then I would prefer to keep the name
> without the "mmc". The readme.txt can explain that the configuration
> supports MMC booting.

I see a point where these defconfig names is in-line with U-Boot
defconfig - since like U-Boot have defconfig based on boot-modes
buildroot have similar approach.

thanks!
-- 
Jagan Teki
Senior Linux Kernel Engineer | Amarula Solutions
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
