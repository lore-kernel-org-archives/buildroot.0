From: Mark Corbin <mark.corbin@embecosm.com>
Date: Wed, 12 Sep 2018 17:14:50 +0100
Subject: [Buildroot] [PATCH v2 0/6] Add RISC-V 64-bit architecture
 support
In-Reply-To: <20180912171801.36045fb5@windsurf>
References: <20180912102256.3164-1-mark.corbin@embecosm.com>
 <20180912171801.36045fb5@windsurf>
Message-ID: <76f5de73-64f9-370d-b0b3-91aadf495191@embecosm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas

On 12/09/18 16:18, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 12 Sep 2018 11:22:50 +0100, Mark Corbin wrote:
>
>> Mark Corbin (6):
>>   linux: add hash file
>>   package/linux-headers: add support for custom headers
>>   arch: allow GCC target options to be optionally overwritten
>>   arch: add support for RISC-V 64-bit (riscv64) architecture
>>   boot/riscv-pk: add bootloader for RISC-V architecture
>>   configs/qemu: add qemu_riscv64_virt_defconfig
> Thanks a lot for this new version! From a quick look it looks pretty
> good! I'll comment on each patch separately.

Just let me know which ones, if any, need re-spinning.

Thanks

Mark

>
> Best regards,
>
> Thomas

-- 
Mark Corbin
Embecosm Ltd.
https://www.embecosm.com
