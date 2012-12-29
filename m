From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 16:13:14 +0200
Subject: [Buildroot] (no subject)
In-Reply-To: <20121229085947.130784d2@skate>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121229085947.130784d2@skate>
Message-ID: <50DEFA7A.7020002@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

29.12.2012 9:59, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sat, 29 Dec 2012 03:45:48 +0200, Stefan Fr?berg wrote:
>
>> Finally after dosens of reruns got damn Mesa 8.0.5 to compile.
>> The biggest obstacle was src/glsl/builtin_compiler but after
>> searching Net for how others had done it I finally got it.
>>
>> mesa3d-uclibc-locale.patch did not apply cleanly anymore to this
>> version.
>> So I had to fetch new one from openembedded repo.
>> Did take also few other patches from there 
>> and fixed execinfo.h stuff.
> Thanks. Having five patches with the same title is not correct. And
> since it seems your five patches are all together needed to get Mesa
> 8.0.5 to build, then you should simply merge your five patches into
> just one.
>
> I'm adding specific comments on each patch.
>
> Thanks!
>
> Thomas

Thomas, can you tell a git newbie like me how to make single patch but
still keeping that Signed-off line in
each logical file in that single one patch ?

I mean like this:

Signef-off: Stefan

Some stuff....

Signef-off: Stefan

Some more stuff ....


etc.....


So far I have done the following:

create branch

make some changes
git add those_changes
git commit -s -m "description"

repeat the previous three if necessary

git format-patch -M master

git send-email .......
