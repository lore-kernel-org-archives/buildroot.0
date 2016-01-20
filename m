From: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
Date: Wed, 20 Jan 2016 14:59:19 +0530
Subject: [Buildroot] [PATCH V2] NVME Makefile update
In-Reply-To: <20160120101624.5c41e419@free-electrons.com>
References: <20160120034712.7432.71222.stgit@localhost.localdomain>
 <20160120101624.5c41e419@free-electrons.com>
Message-ID: <569F536F.9090505@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sure Thomas, will do that.

Thanks
Mamatha


On 01/20/2016 02:46 PM, Thomas Petazzoni wrote:
> Dear Mamatha Inamdar,
>
> On Wed, 20 Jan 2016 09:19:41 +0530, Mamatha Inamdar wrote:
>> Makefile cleanup: remove -Werror flag in CFLAGS
>>
>> Signed-off-by: Mamatha Inamdar <mamatha4@linux.vnet.ibm.com>
> Thanks, but this should be part of the patch adding the nvme package.
> Could you please send a *single* patch that:
>
>   - Adds package/nvme/ (with nvme.mk, nvme.hash *and*
>     0001-NVME-Makefile-cleanup.patch)
>
>   - Changes package/Config.in to include package/nvme/Config.in
>
> Thanks!
>
> Best regards,
>
> Thomas
