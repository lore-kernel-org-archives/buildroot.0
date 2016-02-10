From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Wed, 10 Feb 2016 20:37:13 +0530
Subject: [Buildroot] [PATCH V7] package/nvme: new package
In-Reply-To: <56B2EAC9.1090801@linux.vnet.ibm.com>
References: <20160121052928.8568.3019.stgit@localhost.localdomain>
 <56B2EAC9.1090801@linux.vnet.ibm.com>
Message-ID: <56BB5221.1000504@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Please let us know when NVME patches will get into the build?

On 02/04/2016 11:38 AM, Mamatha Inamdar wrote:
> Hi Thomas,
>
> When NVME patch will get into "buildroot" project ?
>
>
> On 01/21/2016 11:06 AM, Mamatha Inamdar wrote:
>> Add support for building NVME utility - a utility for interacting with
>> standard NVM Express (optimized PCI Express SSD interface) devices.
>>
>> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
>> ---
>>   package/Config.in                             |    1 +
>>   package/nvme/0001-NVME-Makefile-cleanup.patch |   25 
>> +++++++++++++++++++++++++
>>   package/nvme/Config.in                        |    6 ++++++
>>   package/nvme/nvme.hash                        |    2 ++
>>   package/nvme/nvme.mk                          |   22 
>> ++++++++++++++++++++++
>>   5 files changed, 56 insertions(+)
>>   create mode 100644 package/nvme/0001-NVME-Makefile-cleanup.patch
>>   create mode 100644 package/nvme/Config.in
>>   create mode 100644 package/nvme/nvme.hash
>>   create mode 100755 package/nvme/nvme.mk
>> neric-package))
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
