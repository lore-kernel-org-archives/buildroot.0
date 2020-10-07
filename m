From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2020 21:02:39 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <CANQCQpbNPFjL=0_fOvq69WfnU5AYBepvnh8QFqZZKO+foe1gbg@mail.gmail.com>
References: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
 <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
 <aae92521-2c14-ff28-b092-6f3e89ae2b50@mind.be>
 <CANQCQpYJxsgXvkySKQEiiOrbfmCKEM9VU-3i04KZxPC=pmTejQ@mail.gmail.com>
 <CANQCQpbNPFjL=0_fOvq69WfnU5AYBepvnh8QFqZZKO+foe1gbg@mail.gmail.com>
Message-ID: <8c968778-f87b-5998-86a5-f6e34a5e9a34@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2020 15:21, Matthew Weber wrote:
> Arnout,
> 
> On Wed, Oct 7, 2020 at 7:44 AM Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>>
>> Arnout,
>>
>>
>> On Tue, Oct 6, 2020 at 4:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>
>>>
>>> On 24/09/2020 21:29, Matt Weber wrote:
>>>> Migrating the support for this feature to uboot-tools to gain the
>>>> ability to build env files when BR2_TARGET_UBOOT isn't selected.
>>>>
>>>> Note: This patch creates a circular dependency with uboot until the
>>>> similar migration patch is merged for uboot scripts
>>>>
>>>> Cc: Arnout Vandecappelle <arnout@mind.be>
>>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>>
>>>  Series applied with the changes as explained in my reply to patch 1, and a few
>>> additional changes. Please have a got with current master to check if I broke
>>> anything.
>>>
>>
>> Changes looked good, however I forgot to also include a fixup for all
>> the defconfigs using the feature.  I'll get a patch ready this morning
>> and sent out.
>>
> 
> Here's the bugfix.  My bad on this one.

 My bad for not noticing when applying :-)

> http://patchwork.ozlabs.org/project/buildroot/list/?series=206474

 Thanks for the fix! I'll apply right away.

 Regards,
 Arnout
