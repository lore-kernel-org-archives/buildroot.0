From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Sep 2018 21:57:11 +0200
Subject: [Buildroot] [PATCH 1/1] configs/qemu: add
 qemu_riscv64_virt_defconfig
In-Reply-To: <6b529ca2-bfeb-227e-e76b-0465e52d8bf0@embecosm.com>
References: <20180831143853.24340-1-mark.corbin@embecosm.com>
 <20180902214755.139a1b23@windsurf>
 <6b529ca2-bfeb-227e-e76b-0465e52d8bf0@embecosm.com>
Message-ID: <cd1fb718-2f8e-571e-d217-1d37ebc73b28@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/09/2018 17:14, Mark Corbin wrote:
> I had been reluctant to add riscv-pk to Buildroot as a bootloader, as I
> see it as an interim solution until riscv support makes it into UBoot or
> Barebox.

 If riscv-pk/bbl offers all the features you need, why would you use U-Boot or
Barebox?

> On the other hand, riscv kernel images aren't much use without
> it at the moment.
> 
> I do have a preliminary riscv-pk package working based on your helpful
> pointers to boot-wrapper-aarch64. Do people prefer to add it as
> 'risc-pk' when it is only the Berkeley Boot Loader part that is
> significant? I would have added it as 'bbl', but I can see the potential
> confusion when the package/repository is 'riscv-pk'.

 Unless there is some convincing reason for it, we prefer to stick with the
upstream name.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
