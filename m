From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 00:01:22 +0100
Subject: [Buildroot] [PATCH 1/1] manual/faq: add section about why no
 binary packages
In-Reply-To: <CANxTyt5-j5636R=1KY5uNyvEDRHHwUNz76VaaeMjjK67Qw8OTw@mail.gmail.com>
References: <cover.1392659250.git.yann.morin.1998@free.fr>
 <430595ea81c22aef392d3aec25cc93ef9af7bd47.1392659250.git.yann.morin.1998@free.fr>
 <CANxTyt68QiKO_qyqkUtQ5wHHtA8xuTk18uf6e9jatLZ-AK24UA@mail.gmail.com>
 <20140217213729.GC3411@free.fr>
 <CANxTyt5-j5636R=1KY5uNyvEDRHHwUNz76VaaeMjjK67Qw8OTw@mail.gmail.com>
Message-ID: <530294C2.40400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/02/14 23:48, Danomi Manchego wrote:
> Yann,
> 
> On Mon, Feb 17, 2014 at 4:37 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > Danomi, All,
>> >
>> > On 2014-02-17 15:21 -0500, Danomi Manchego spake thusly:
>>> >> Nit-picky writing editorial - no issue with the actual content ...
>> >
>> > Thank you!
>> >
>> > My answers below...
>> >
>>> >> On Mon, Feb 17, 2014 at 12:52 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > [--SNIP--]
>>>> >> > +[[faq-no-binary-packages]]
>>>> >> > +Why doesn't Buildroot generate binary packages (.deb, .ipkg...)?
>>>> >> > +----------------------------------------------------------------
>>>> >> > +
>>>> >> > +One feature that is often discussed on the Buildroot list, is the
>>> >>
>>> >>  no comma
>> >
>> > Fixed.
>> >
>>>> >> > +the general topic of "package management". To summarize, the idea
>>>> >> > +would be to add some tracking of which Buildroot package installs
>>>> >> > +what files, with the goals of:
>>>> >> > +
>>>> >> > + * Being able to remove files installed by a package when this package
>>>> >> > +   gets unselected from the menuconfig ;
>>> >>
>>> >> ; -> .
> It seems strange to me that a bulleted list is also considered a
> complete sentence.  I think of bulleted lists like an unsorted list of
> items, as opposed to a numbered list where numbers have meaning.  But
> it's your party, keep as you like.

 If you have a colon in front of it and a semicolon at the end, then the
sentence shouldn't be capitalized. So:

with the goals of:

* being able to remove files;
* being able to do the other thing.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
