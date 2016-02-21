From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 21 Feb 2016 09:21:24 -0300
Subject: [Buildroot] state of olimex_imx233_olinuxino_defconfig
In-Reply-To: <87egc7c7y8.fsf@dell.be.48ers.dk>
References: <CAPiYbRL+v9QK+cK1D+kmyPx58wx8ehmZVWGDQHRTzRe5=diHfg@mail.gmail.com>
 <87egc7c7y8.fsf@dell.be.48ers.dk>
Message-ID: <56C9ABC4.1070506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/02/16 19:50, Peter Korsgaard wrote:

>>>>>> "Phil" == Phil Eichinger <phil.eichinger@gmail.com> writes:
>
>   > Hello
>   > I recently tried olimex_imx233_olinuxino_defconfig and created the SD
>   > card according to the readme.txt. It failed to boot with:
>   > "
>   > PowerPrep start initialize power...
>   > Battery Voltage = 0.74V
>   > No battery or bad battery
>   > detected!!!.Disabling battery
>   > voltage measurements./r/nLLCFeb 16 201616:01:38
>   > EMI_CTRL 0x1C084040
>   > FRAC 0x92926192
>   > init_ddr_mt46v32m16_133Mhz
>   > power 0x00820710
>   > Frac 0x92926192
>   > start change cpu freq
>   > hbus 0x00000003
>   > cpu 0x00010001
>   > LLLLLLLFCLJ
>   > "
>   > Looks like the handover to the kernel is somehow broken, as it is not starting.
>
> Sorry, no experience with imx233 / mxs-bootlets. Gustavoz, you've done
> various updates to the defconfig. Does it work for you? Any hints?
>
>   > I am however not sure if I should submit an updated defconfig or a new
>   > one like olimex_imx233_olinuxino_uboot_defconfig and extend the
>   > readme.txt to cover both use cases?
>
> Lets see what Gustavoz says.

Hi All.
Unfortunately i don't have an olinuxino in my hands any more.
It's very likely bootlets isn't happy with newer toolchain components - 
it's known to be somewhat fragile in that aspect, so if someone wants to 
update the defconfig to use uboot that would be great.
That wasn't a viable option when i added it since it didn't work vanilla.
Regards.
