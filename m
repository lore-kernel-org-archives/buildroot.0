From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 12 Apr 2017 07:56:40 -0700
Subject: [Buildroot] [PATCH] package/xen: Update to version 4.8.1
In-Reply-To: <20170412100452.06a8eebb@free-electrons.com>
References: <20170411214803.5948-1-alistair.francis@xilinx.com>
 <20170412100452.06a8eebb@free-electrons.com>
Message-ID: <CAKmqyKMtjhPccBo16xEbpmicHF5s6ZkXznjKVy1LuCRHFnqD5A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Apr 12, 2017 at 1:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 11 Apr 2017 14:48:03 -0700, Alistair Francis wrote:
>> Update Xen to version 4.8.1 and update the patches to allow Xen
>> hypervisor and Xen tools to build.
>>
>> The patches applied were re-aranged a little bit. Patches 2, 3 and 4
>> have been accepted by upstream Xen and won't be required in future
>> releases.
>>
>> Patch 1 (previously patch 2) is still required and was moved to patch 1
>> to better reflect it's status.
>>
>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>> ---
>
> Thanks for this new patch. However, it's missing a version number and a
> changelog compared to the previous iteration, so I don't know what
> changed.

Yeah, it changed title so I reset the numbering.

I'll send a V2 that includes a changelog from the old series.

Thanks,

Alistair

>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
