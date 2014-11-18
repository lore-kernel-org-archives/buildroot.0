From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 18 Nov 2014 13:26:47 +0000
Subject: [Buildroot] [PATCH] kmod: bump to version 19
In-Reply-To: <20141118142123.47e08033@free-electrons.com>
References: <1416243576-42474-1-git-send-email-Vincent.Riera@imgtec.com>
 <20141118142123.47e08033@free-electrons.com>
Message-ID: <546B4917.30706@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 11/18/2014 01:21 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Mon, 17 Nov 2014 16:59:36 +0000, Vicente Olivert Riera wrote:
>> - Bump to version 19
>> - Rename 0001 patch to follow the new name convention
>> - Adapt the 0001 patch to the new version
>> - Remove the already-upstreamed 0002 patch
>> - Update the hash value
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Applied to next, thanks. After changing just one thing.
> 
>> diff --git a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch b/package/kmod/0001-fix-O_CLOEXEC.patch
>> similarity index 83%
>> rename from package/kmod/kmod-0001-fix-O_CLOEXEC.patch
>> rename to package/kmod/0001-fix-O_CLOEXEC.patch
>> index 4861c57..e09372c 100644
>> --- a/package/kmod/kmod-0001-fix-O_CLOEXEC.patch
>> +++ b/package/kmod/0001-fix-O_CLOEXEC.patch
>> @@ -1,3 +1,7 @@
>> +Adapt this patch to version 19
>> +
>> +Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I don't think this should go here, otherwise the patch isn't a proper
> git patch anymore. Instead, I modified the commit log to add the fact
> that you updated the patch to version 19, and added your SoB below
> Thomas DS one.
> 
> See:
> http://git.buildroot.net/buildroot/tree/package/kmod/0001-fix-O_CLOEXEC.patch?h=next.

yes, I agree that's better. Thank you Thomas, I will do it in that way
from now on :-)

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
