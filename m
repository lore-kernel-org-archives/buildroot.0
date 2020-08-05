From: Matthew Weber <matthew.weber@collins.com>
Date: Wed, 5 Aug 2020 11:18:24 -0500
Subject: [Buildroot] [PATCH 1/1] package/libnids: NVD database has been
 updated
In-Reply-To: <CANQCQpZH6pt2-vs-9vi7Tw0TFz3HjkT2ftqzGM3vwzot-RU5MQ@mail.gmail.com>
References: <20200721180555.31453-1-guillaume.bressaix@gmail.com>
 <20200721204324.58fa9cc2@windsurf.home>
 <CANQCQpb3NtawUS-fGVDXn+jfvjS2mh1T--r815m8jsnSj0wYHw@mail.gmail.com>
 <CAJe0E3cP6oppGocO9LuE+-ctjicSq1oRh8p2qD=gZdwi7N+_aQ@mail.gmail.com>
 <CANQCQpZH6pt2-vs-9vi7Tw0TFz3HjkT2ftqzGM3vwzot-RU5MQ@mail.gmail.com>
Message-ID: <CANQCQpaMBp6U2vvhVPHqA24osijfPS6PcCOgoduEPg=U61QLdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It has been fixed but I had to update the wiki notes because there are two
steps.  The first is a CVE description update by the Mitre/CVE team and the
second is a CPE assignment update by the dictionary team.  I checked the
NVD link that Thomas provided and it looks correct to me.

On Thu, Jul 30, 2020 at 1:01 PM Matthew Weber <matthew.weber@collins.com>
wrote:

> Guillaume, I've submitted another request with more detail and hopefully
> they'll update all the references to the version
>
> On Wed, Jul 22, 2020 at 2:34 AM Guillaume Bres <
> guillaume.bressaix at gmail.com> wrote:
>
>> Ugh, looks like they only updated the description and didn't adjust the
>>> rest of the version references
>>
>>
>> yes that's what happened ? we may need to wait a little longer
>>
>> Guillaume W. Bres
>> Software engineer
>> <guillaume.bressaix@gmail.com>
>>
>>
>> Le mar. 21 juil. 2020 ? 22:09, Matthew Weber <matthew.weber@collins.com>
>> a ?crit :
>>
>>> Ugh, looks like they only updated the description and didn't adjust the
>>> rest of the version references
>>>
>>> https://nvd.nist.gov/vuln/detail/CVE-2010-0751#match-5471142
>>>
>>> On Tue, Jul 21, 2020 at 1:46 PM Thomas Petazzoni <
>>> thomas.petazzoni at bootlin.com> wrote:
>>>
>>>> On Tue, 21 Jul 2020 20:05:55 +0200
>>>> guillaume.bressaix at gmail.com wrote:
>>>>
>>>> > From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
>>>> >
>>>> > Thanks to Matthew W. & Thomas, the NVD database has been updated
>>>> > and CVE-2010-0751 is now declared fixed, see
>>>> > https://security-tracker.debian.org/tracker/CVE-2010-0751
>>>> >
>>>> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>>>>
>>>> Are you sure it has already been fixed ?
>>>>
>>>> https://nvd.nist.gov/vuln/detail/CVE-2010-0751 still marks 1.24 as
>>>> affected as far as I can see.
>>>>
>>>> Thomas
>>>> --
>>>> Thomas Petazzoni, CTO, Bootlin
>>>> Embedded Linux and Kernel engineering
>>>> https://bootlin.com
>>>> _______________________________________________
>>>> buildroot mailing list
>>>> buildroot at busybox.net
>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>
>>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200805/69fc01a4/attachment-0001.html>
