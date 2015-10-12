From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 12 Oct 2015 13:56:58 -0500
Subject: [Buildroot] [PATCH 1/1] [arm64 uboot] Resolved compilation
 issue for arm64 uboot
In-Reply-To: <CANQCQpbWt9-24pXF20WUpoim-PYdbqYW0imaLMQ4uK5nEv2FDA@mail.gmail.com>
References: <1444664954-64180-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20151012193942.75ee6483@free-electrons.com>
 <CANQCQpbWt9-24pXF20WUpoim-PYdbqYW0imaLMQ4uK5nEv2FDA@mail.gmail.com>
Message-ID: <CANQCQpY3HWjmUmsyAygOhAwAFvwDyzZoy2oDiq7vU4NwKS3sAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Oct 12, 2015 at 1:51 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Mon, Oct 12, 2015 at 12:39 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Matt Weber,
>>
>> On Mon, 12 Oct 2015 10:49:14 -0500, Matt Weber wrote:
>>
>>> This patch has been added to resolve the compilation issue
>>> of arm64 uboot.
>>>
>>> For aarch64 architecture, kernel uses arm64 terminology and thus from
>>> top-level Makefile KERNEL_ARCH is modified to arm64 for aarch64 which
>>> then passed to uboot compilation. But, it causes compilation issue
>>> while including architecture specific Makefile under
>>> arch/$(ARCH)/Makefile as uboot uses top-level system architecture as
>>> arm only.
>>
>> I'm not a native english speaker, but the wording of this sentence
>> doesn't seem quite right.
>>
>> The title of the commit should be:
>>
>>         uboot: <something>
>>
>>> +# For aarch64 architecture, kernel uses arm64 terminology and thus from
>>> +# # top-level Makefile KERNEL_ARCH is modified to arm64 for aarch64 which
>>> +# # then passed to uboot compilation. But, it causes compilation issue
>>> +# # while including architecture specific Makefile under arch/$(ARCH)/Makefile
>>> +# # as uboot uses top-level system architecture as arm only.
>>
>> Double hashes a the beginning of each line -> not good.
>>
>> Care to fix that up (especially rewording the commit log and comment) ?
>>
>
> Yeah, not a problem.  I should have a new revision out soon.

I went ahead and marked this one as superseded.

>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux, Kernel and Android engineering
>> http://free-electrons.com
>
>
>
> --
> Matthew L Weber / Pr Software Engineer
> Airborne Information Systems / Security Systems and Software / Secure Platforms
> MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
> www.rockwellcollins.com
>
> Note: Any Export License Required Information and License Restricted
> Third Party Intellectual Property (TPIP) content must be encrypted and
> sent to matthew.weber at corp.rockwellcollins.com.



-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
