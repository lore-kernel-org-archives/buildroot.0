From: Eric Nelson <eric.nelson@boundarydevices.com>
Date: Fri, 25 Jul 2014 10:01:55 -0700
Subject: [Buildroot] [PATCH] libfslvpuwrap: fix tests of return value
	from IOGetVirtMem
In-Reply-To: <20140725165550.GB3955@free.fr>
References: <1406270593-17193-1-git-send-email-bisson.gary@gmail.com>
 <20140725165550.GB3955@free.fr>
Message-ID: <53D28D83.3020608@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 07/25/2014 09:55 AM, Yann E. MORIN wrote:
> Gary, All,
> 
> <snip>
>
>> --- /dev/null
>> +++ b/package/libfslvpuwrap/libfslvpuwrap-0001-vpu_wrapper-fix-tests-of-return-value-from-IOGetVirt.patch
>> @@ -0,0 +1,41 @@
>> +From 7ca66c10c05168c7d342df7c7a70d4a1ae0629f7 Mon Sep 17 00:00:00 2001
>> +From: Eric Nelson <eric.nelson@boundarydevices.com>
>> +Date: Sat, 28 Jun 2014 09:45:09 -0700
>> +Subject: [PATCH] vpu_wrapper: fix tests of return value from IOGetVirtMem
>> +
>> +IOGetVirtMem() returns a pointer or specifically -1 (MAP_FAILED)
>> +in the case of failure.
>> +
>> +Upstream-Status: Pending
> 
> Is there a public URL to the bug report or the patch submission?
> If so, can you paste the URL here, so we know when we update that we
> need to remove that patch?
>

Since Freescale is now basing their releases on Yocto, the
meta-freescale list is the best equivalent of "upstream"
for these Freescale components.

Unfortunately, patches there are in a different form, and
I pushed the equivalent forms and they were acked and
promises made by Freescale (Lauren) to include in the next
release:

	https://lists.yoctoproject.org/pipermail/meta-freescale/2014-June/thread.html#8881

Regards,


Eric
