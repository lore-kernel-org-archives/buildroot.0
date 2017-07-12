From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 12 Jul 2017 13:35:15 -0500
Subject: [Buildroot] [PATCH v2] python-systemd: add new package
In-Reply-To: <CAGm1_kv41ZqKYE+kwHJUb2wyH5dES_hesvcwOJEXYHX3mXc7yQ@mail.gmail.com>
References: <20170712024121.2564-1-andrew.smirnov@gmail.com>
 <20170712043701.frfvmmnf535ukcjk@sapphire.tkos.co.il>
 <CAGm1_kv41ZqKYE+kwHJUb2wyH5dES_hesvcwOJEXYHX3mXc7yQ@mail.gmail.com>
Message-ID: <CAHQ1cqGSuuEBdww9r0T-WR7rKNWyfAXROYPVfTN9307GW4rRtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 12, 2017 at 2:31 AM, Yegor Yefremov
<yegorslists@googlemail.com> wrote:
> Hi Andrey,
>
> On Wed, Jul 12, 2017 at 6:37 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>> Hi Andrey,
>>
>> On Tue, Jul 11, 2017 at 07:41:21PM -0700, Andrey Smirnov wrote:
>>> Add package for official python bindings availibe as a part of systemd
>>> project at: https://github.com/systemd/python-systemd
>>>
>>> Minimal config snippet for utils/test-pkg is as follows (sans
>>> backslashes):
>>>
>>> \# BR2_INIT_BUSYBOX is not set
>>> \# BR2_INIT_SYSV is not set
>>
>> You can use the --cleanup=whitespace parameter of the 'git commit' command to
>> skip the removal of lines starting with '#'. That would make config fragments
>> look nicer.
>
> With Baruch's changes applied you can add my Reviewed-by: Yegor
> Yefremov <yegorslists@googlemail.com>
>

OK, will do in v3.

Thanks,
Andrey Smirnov
