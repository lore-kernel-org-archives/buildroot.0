From: Martin Banky <Martin.Banky@gmail.com>
Date: Tue, 21 Sep 2010 16:04:14 -0700
Subject: [Buildroot] [PATCH 19/21] openssl: bump to 1.0.0a
In-Reply-To: <AANLkTik2f=4p9jfBuuQ+3P1vq6wu6EjM15nUke-J4RO3@mail.gmail.com>
References: <1284864823-18993-1-git-send-email-Martin.Banky@gmail.com>
	<1284864823-18993-20-git-send-email-Martin.Banky@gmail.com>
	<4C95E051.4010507@googlemail.com>
	<AANLkTik2f=4p9jfBuuQ+3P1vq6wu6EjM15nUke-J4RO3@mail.gmail.com>
Message-ID: <AANLkTinSYaHEfjFCon+K51hapZrc_COCvBvH_06Pj3qt@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcus,
     I've done some research, and have not found any issues with openssl
1.0.0.a not being compatible with any packages. If anyone knows of one,
please let me know. Note: openssl 1.0.0a is not necessarily binary
compatible to openssl 0.9.8o, but it is api compatible.

Martin

On Sun, Sep 19, 2010 at 9:51 AM, Martin Banky <Martin.Banky@gmail.com>wrote:

> Marcus,
>      I hadn't heard about any compatibility problems between the two
> versions. I thought that 1.0.0a was just the next increment of openssl, and
> not a "forked" version. I would be interested if you could point me to where
> you had seen the information about the problems with 1.0. I've been running
> 1.0.0, since it first came out, and then upgraded to 1.0.0.a. There are at
> least two packages that I'm using that need openssl (dropbear and qt) that
> have been working just fine.
>
> Martin
>
>
> On Sun, Sep 19, 2010 at 3:05 AM, Marcus Osdoba <
> marcus.osdoba at googlemail.com> wrote:
>
>>  Am 19.09.2010 04:53, schrieb Martin Banky:
>>
>>> Signed-off-by: Martin Banky<Martin.Banky@gmail.com>
>>> ---
>>> [...]
>>>
>> Hi Martin,
>>
>> Again just my comments about new openssl.
>>
>> Somewhere I read, that openssl 1.0 is not in all cases compatible to
>> openssl 0.9.8.
>> Some package combinations need to have both versions installed in
>> parallel.
>> Maybe it is to early to upgrade to 1.0 as a complete replacement for 0.9
>> ->
>> - we can wait until all upstream packages are able to cope with 1.0 (I
>> don't know which are working fine and which need former version)
>> - provide both versions (1.0 and 0.9) in parallel
>> - maybe it is safe to replace 0.9 with 1.0 - but who will make the test
>> with all userland packages...?
>>
>> Just my thoughts about it...
>>
>>
>> Regards,
>> Marcus
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100921/1eb01fbb/attachment.html>
