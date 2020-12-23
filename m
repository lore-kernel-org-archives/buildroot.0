From: Romain Naour <romain.naour@smile.fr>
Date: Wed, 23 Dec 2020 14:45:22 +0100
Subject: [Buildroot] [PATCH] board/boundarydevices: add promote
 buildroot-external-boundary project
In-Reply-To: <X+NHsOg/INvG2IBc@p1g2>
References: <20201223125651.6818-1-romain.naour@smile.fr>
 <X+NHsOg/INvG2IBc@p1g2>
Message-ID: <328f6049-c714-2f5b-7404-1c47727fa461@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

Le 23/12/2020 ? 14:35, Gary Bisson a ?crit?:
> Hi Romain,
> 
> On Wed, Dec 23, 2020 at 01:56:51PM +0100, Romain Naour wrote:
>> It may be useful for users using Boundary Devices boards to find
>> more advanced defconfigs that the one provided by Buildroot.
>>
>> See:
>> https://github.com/boundarydevices/buildroot-external-boundary#configurations-details
>>
>> Update the readme.txt to add the link to the br2_external maintained
>> by Boundary Devices.
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Cc: Gary Bisson <gary.bisson@boundarydevices.com>
>> ---
>>  board/boundarydevices/common/readme.txt | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
>> index d1bb3fa598..62bc0d3f81 100644
>> --- a/board/boundarydevices/common/readme.txt
>> +++ b/board/boundarydevices/common/readme.txt
>> @@ -40,3 +40,13 @@ Where 'sdX' is the device node of the uSD partition.
>>  To upgrade u-boot, cancel autoboot and type:
>>  
>>  > run upgradeu
>> +
>> +See Boundary Devices's buildroot-external-boundary project
>> +for additional and advanced defconfigs using Qt5, gstreamer,
>> +NXP proprietary packages with demo applications:
>> +
>> +https://github.com/boundarydevices/buildroot-external-boundary
>> +
>> +Only some stable Buildroot releases are supported (2017.08.x,
>> +2018.02.x, 2020.08.x). Using another Buildroot version may
>> +requires some work.
> 
> s/requires/require
> 
> I'm actually not sure if this warning is necessary. I' don't mind having
> people opening issues in the repo if they want to use another version.
> If we see several requests for another branch we'll move the task higher
> up our todo list ;)

Ok if you prefer removing this warning. Anyway this can be expected by using a
br2_external tree :)

> 
> Thanks for the patch. Hope those configurations have been useful.

Those defconfig are a good starting point for full featured configuration (IMHO).

> 
> Note that the plan is to merge 8MP GA release (NXP "5.4.70_2.3.0") in
> time for 2021.02 and have that branch supported.

Yes that a good plan :)

Best regards,
Romain


> 
> Regards,
> Gary
> 
