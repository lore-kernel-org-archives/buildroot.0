From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 04 Jan 2013 16:42:45 +0200
Subject: [Buildroot] [PATCH v2 2/2] rxvt-unicode: new package
In-Reply-To: <20130104002721.0a0e5e30@skate>
References: <1356633918-16114-1-git-send-email-stefan.froberg@petroprogram.com>
 <1356633918-16114-2-git-send-email-stefan.froberg@petroprogram.com>
 <20130104002721.0a0e5e30@skate>
Message-ID: <50E6EA65.6090001@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

4.1.2013 1:27, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Thu, 27 Dec 2012 20:45:18 +0200, Stefan Fr?berg wrote:
>> This patch will ensure that rxvt-terminfo files will be created.
>> Upstream-Status: Pending
>>
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> Please merge this patch into the previous patch.
>
> It seems that there a misunderstanding on how patches should be
> submitted. If your new package requires a certain number of patches to
> build or behave properly, then those patches should be part of the
> patch adding the package.
>
> Generally, for simple packages, only one patch to Buildroot is needed.

Yeah, Im still confused when to break it to pieces.

But Isn't it much more easier to drop some patches if I wrap them to
individual,
isolated patches ??

I mean, for example that elfutils patch set that I posted, it has 12
files and if
one of those files (except #1 and #2 ofcourse) seems to not work out
then isn't it
much more easier to just drop that one problematic patch than to
remodify one huge patch again and again? Right?

And I would never have submitted that firefox patch in one huge chunk
because
it would have been too much work for poor reviewer(s)
(thanks a million about reviewing it Arnout! i haven't forgotted about
those fixes you mentioned
and will kick new patch series out soon)

So for small packages single patch is kosher but for large (where does
the line go?) it is acceptable
to break it (like what Yan and others do) ???

Regards
Stefan



>> ---
>>  .../rxvt-unicode/rxvt-unicode-9.15-terminfo.patch  |   12 ++++++++++++
>>  1 files changed, 12 insertions(+), 0 deletions(-)
>>  create mode 100644 package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
>>
>> diff --git a/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
>> new file mode 100644
>> index 0000000..910ce76
>> --- /dev/null
>> +++ b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
>> @@ -0,0 +1,12 @@
> Your patch lacks a description and Signed-off-by line.
>
> Thanks!
>
> Thomas
