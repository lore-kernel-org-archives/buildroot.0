From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 27 Jan 2013 21:41:05 +0200
Subject: [Buildroot] Buildroot Developers Meeting after FOSDEM 2013
In-Reply-To: <201301271709.49546.yann.morin.1998@free.fr>
References: <20121228212925.3c5074c6@skate>
 <201301271709.49546.yann.morin.1998@free.fr>
Message-ID: <510582D1.9040306@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

27.1.2013 18:09, Yann E. MORIN kirjoitti:
> Thomas, All,
>
> On Friday 28 December 2012 Thomas Petazzoni wrote:
>> As was announced after the previous Developers Meeting, the next one
>> will take place on February 4th and 5th 2013 in Brussels, right after
>> the FOSDEM conference (http://www.fosdem.org).
>>
>> I've set up a Wiki page to coordinate the organization of this meeting,
>> see http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013.

Oh, goody. <pkg>_CONFIG_FIXUP is on the list :-)
Submitting, final v3 tomorrow, I promise.... just get sidetracked by
other things

> I've started adding a few topics to be discused during the meeting, by
> adding the latest topics that have flown on the mailing list in the past
> few weeks. I've undoubtfully missed some of them!
>
> Please review, and add to this list.
>
> Looking forward to this moment! :-)
>
> Regards,
> Yann E. MORIN.
>

I think the current state of generating initramfs could be added to that
topic list too.

I did some quick testing of buildroot (2012.08)  kernel with embedded
initramfs size vs. also buildroot kernel but with hand made initramfs
inside it (both from the same sources of course)
and the results were 57 MB vs. 37 MB (xz-compressed kernel with no
compression for built-in initramfs).

Exactly same software stuff in both but different sizes because
different configuration knobs in linux .config-files and different
compression methods used.

So optimal initramfs generation (with right linux .config settings and
maybe with Gustavo's initramfs patches) with benchmark maybe
(size of output, ram taking to load/decompress and speed taking to
decompress) would be cool topic. :-)

Regards
Stefan
