From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 5 Feb 2013 07:50:12 +0200
Subject: [Buildroot] [PATCH] toolchain-external: add new Microblaze
 toolchains
In-Reply-To: <1360021954-21225-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1360021954-21225-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20130205055011.GB4116@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 05, 2013 at 12:52:34AM +0100, Thomas Petazzoni wrote:
> +config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
> +	bool "Xilinx Little Endian Microblaze GNU Tools"

[...]

> +config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
> +	bool "Xilinx Little Endian Microblaze GNU Tools"

Are both little endian?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
