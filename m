From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 20 Jun 2016 23:30:13 +0200
Subject: [Buildroot] [git commit] python-pytablewriter: new package
In-Reply-To: <20160620211801.GC22414@free.fr>
References: <20160620205603.48C1881D8B@busybox.osuosl.org>
 <20160620211801.GC22414@free.fr>
Message-ID: <CAGm1_kuCK9+UbnOLGfLW8yenBDXY+P3qD1yXZqN=OhAXim8Ghg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Mon, Jun 20, 2016 at 11:18 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Yegor, Peter, All,
>
> On 2016-06-20 22:52 +0200, Peter Korsgaard spake thusly:
>> commit: https://git.buildroot.net/buildroot/commit/?id=0ba8c959239499fd4abd74c90d1f8100252b3fc0
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  package/Config.in                                      |  1 +
>>  package/python-pytablewriter/Config.in                 | 13 +++++++++++++
>>  package/python-pytablewriter/python-pytablewriter.hash |  4 ++++
>>  package/python-pytablewriter/python-pytablewriter.mk   | 14 ++++++++++++++
>>  4 files changed, 32 insertions(+)
>>
>> diff --git a/package/Config.in b/package/Config.in
>> index aa1da13..ce71afb 100644
>> --- a/package/Config.in
>> +++ b/package/Config.in
>> @@ -758,6 +758,7 @@ menu "External python modules"
>>       source "package/python-six/Config.in"
>>       source "package/python-smbus-cffi/Config.in"
>>       source "package/python-spidev/Config.in"
>> +     source "package/python-pytablewriter/Config.in"
>
> Not in alphabetical order. ;-)

Noooo! I was to concentrated on 'table' :-) Will send a fix.

Yegor
