From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 25 Apr 2020 22:34:05 +0200
Subject: [Buildroot] [PATCH 1/2] board/qemu/microblaze: convert kernel
 patch to git format
In-Reply-To: <20200425222010.2f6d9899@windsurf.home>
References: <20200425195848.205599-1-romain.naour@gmail.com>
 <20200425222010.2f6d9899@windsurf.home>
Message-ID: <64e4de9f-0b98-ae17-93a5-52e8582d7095@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 25/04/2020 ? 22:20, Thomas Petazzoni a ?crit?:
> On Sat, 25 Apr 2020 21:58:47 +0200
> Romain Naour <romain.naour@gmail.com> wrote:
> 
>> Convert the patch for microblaze kernel added for kernel 3.14 by
>> Waldemar to git format.
>>
>> Note: the Waldemar Sob line is missing in the original patch:
>> fa2798548368d51998fad18d7f6d1ae0ed065b33
>>
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Waldemar Brodkorb <wbx@openadk.org>
>> ---
>>  ...xilinx-xemaclite-add-2.00.b-revision.patch | 34 +++++++++++++++++++
>>  .../microblazebe-mmu/xilinx-xemaclite.patch   | 11 ------
>>  ...xilinx-xemaclite-add-2.00.b-revision.patch | 34 +++++++++++++++++++
>>  .../microblazeel-mmu/xilinx-xemaclite.patch   | 11 ------
>>  configs/qemu_microblazebe_mmu_defconfig       |  2 +-
>>  configs/qemu_microblazeel_mmu_defconfig       |  2 +-
>>  6 files changed, 70 insertions(+), 24 deletions(-)
>>  create mode 100644 board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
>>  delete mode 100644 board/qemu/microblazebe-mmu/xilinx-xemaclite.patch
>>  create mode 100644 board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch
>>  delete mode 100644 board/qemu/microblazeel-mmu/xilinx-xemaclite.patch
> 
> Series applied. Thanks a lot for the good work, very nice to see these
> defconfigs maintained and updated.

The last time the kernel was updated by my colleague G?r?me, he spent some days
to do the same work. Thanks the Qemu runtime testing it's really easier than
before (Thanks to Yann for the help and final review).

Best regards,
Romain


> 
> Thomas
> 
