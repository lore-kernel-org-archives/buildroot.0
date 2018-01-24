From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Jan 2018 14:17:49 +0200
Subject: [Buildroot] grub/grub2 support on AARCH64 native compilation
In-Reply-To: <BY2PR07MB693C88FA469BDE50F523ABBEAE20@BY2PR07MB693.namprd07.prod.outlook.com>
References: <DM2PR07MB703B7C9C8A5B9DF875B9E73EAE20@DM2PR07MB703.namprd07.prod.outlook.com>
 <BY2PR07MB69360D7DF88E734B64BD581EAE20@BY2PR07MB693.namprd07.prod.outlook.com>
 <BY2PR07MB693C88FA469BDE50F523ABBEAE20@BY2PR07MB693.namprd07.prod.outlook.com>
Message-ID: <20180124121749.e55in64g5lwdn3ex@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nitin,

On Wed, Jan 24, 2018 at 11:40:36AM +0000, Saxena, Nitin wrote:
> I want to create VM image for aarch64 using rootfs and grub created by 
> buildroot-2017.11.2 tag. I am doing native compilation on AARCH64.
> 
> So during compilation I am not able to find grub or grub2 option in make 
> menuconfig. Can somebody help me in creating grub for AARCH64

The grub/grub2 packages in Buildroot only support x86 targets at the moment.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
