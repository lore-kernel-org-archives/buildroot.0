From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Sep 2016 08:29:45 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <CALe+oY-xM=Jqk17OH199Ow6wGcF193M3iKgbuYs6s7CPyKAFBw@mail.gmail.com>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <b35ba70e-9552-577c-0bea-4a50e6b5fe4a@mind.be>
 <CALe+oY-xM=Jqk17OH199Ow6wGcF193M3iKgbuYs6s7CPyKAFBw@mail.gmail.com>
Message-ID: <7c8c343e-a63a-50c8-4fc6-6b81265f6bc3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 00:22, James Knight wrote:
> Arnout,
> 
> On Mon, Sep 12, 2016 at 5:33 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
[snip]
>> >  Oh, and there's an active upstream at
>> > https://github.com/rpm-software-management/rpm
>> > Could you submit it there (if still relevant)?
> I'll investigate this. I won't be able to try this until next month or
> so, so I hope having these patches for now will suffice/causes no
> complaints.

 No worries.

>>> >> +     depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_MUSL
>> >
>> >  Could you mention in the commit message what fails on musl? Makes fixing it
>> > later easier.
> I tried to put that information in the actual package portion:
> 
>     depends on !BR2_TOOLCHAIN_USES_MUSL # __fxstat64, _D_EXACT_NAMELEN
> 
> Does that suffice? Or is it better to put it in the comment section?
> Or is a longer comment desire? Either way, I'll clean that up.

 Yep, that's good enough for me.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
