From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed, 31 May 2017 10:49:53 +0200
Subject: [Buildroot] [PATCH 00/16] Bump ejabberd version to 17.04
In-Reply-To: <20170531000435.0505e871@free-electrons.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
 <20170531000435.0505e871@free-electrons.com>
Message-ID: <CAJtjsKZEskDUE4by9rRfAwBPjrz1G-NwOacE+e_uUQ6C1x0ZAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, May 31, 2017 at 12:04 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thanks a lot for this work!

You're welcome. It was indeed a bit more work than what I expected.

>
> On Tue, 30 May 2017 16:51:55 +0200, Johan Oudinet wrote:
>
>>   erlang-goldrush: bump version to 0.1.9
>>   erlang-lager: bump to version 3.2.1
>>   erlang-p1-utils: bump to version 1.0.8
>>   erlang-p1-zlib: bump to version 1.0.2
>>   erlang-p1-cache-tab: bump to version 1.0.7
>>   erlang-p1-iconv: bump to version 1.0.4
>>   erlang-p1-stringprep: bump to version 1.0.8
>>   erlang-p1-tls: bump to version 1.0.11
>>   erlang-p1-stun: bump to version 1.0.10
>>   erlang-p1-sip: bump to version 1.0.11
>>   erlang-p1-xml: bump to version 1.1.22
>>   erlang-p1-yaml: bump to version 1.0.9
>
> I've applied those ones to the next branch, with some minor changes on a
> few patches. I'll reply to the individual patches.

Wow, you're fast. Thanks.

>
>>   erlang-jiffy: New package
>>   erlang-p1-oauth: New package
>>   erlang-p1-xmpp: New package
>>   ejabberd: bump to version 17.04
>
> I do have comments on those ones, so I'll reply to them.

Ok, I'll check your comments. I've also put Christophe in CC as he is
the one who made those new packages (except for erlang-jiffy).

> If you respin before the next branch gets merged back into master,
> please base your next iteration on top of the latest next branch.

Yeah, I've already done that for these patches.
-- 
Johan
