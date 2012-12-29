From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 17:31:34 +0200
Subject: [Buildroot] (no subject) git format-patch
In-Reply-To: <50DF0B08.8050205@googlemail.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121229085947.130784d2@skate> <50DEFA7A.7020002@petroprogram.com>
 <20121229153251.6bdfecfe@skate> <50DF04B3.30801@petroprogram.com>
 <50DF0B08.8050205@googlemail.com>
Message-ID: <50DF0CD6.2040603@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Carsten

29.12.2012 17:23, Carsten Schoenert kirjoitti:
> Hello Stefan,
>
> Am 29.12.2012 15:56, schrieb Stefan Fr?berg:
>
>> That's what I meant. Those *inside* Signed-off tags.
>> How should I add those inside Signed-off tags to individual patches
>> (either my own make or 3rd party)
>> applied to mesa3d ?
>>
>> Does git diff command do that ? It does not have -s switch like commit does.
> I do my signed off while using 'git format-patch'
>
>   git format-patch -s [against_some_branch]
>
> Of course *after* the steps Thomas talked about. ;)
>
> Regards
> Carsten
>

Oh, Ok.
Can you still  please show in simple
line by line example (like I did in question to Thomas) your work
process with git when
you add new package.

So that there is no misunderstanding.
My brain is especially slow today :-)

Regards
Stefan
