From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 14 Mar 2017 18:30:07 -0400
Subject: [Buildroot] [PATCH 1/1] qt: add enable for truetype font
	installation
In-Reply-To: <20170314225824.04ed09ed@free-electrons.com>
References: <1489023348-1796-1-git-send-email-danomimanchego123@gmail.com>
 <20170310194327.489b9398@gmx.net> <20170314225824.04ed09ed@free-electrons.com>
Message-ID: <CANxTyt4FijQ_wuZtc7aanE2rM9aCji59k1CVnBokTyHypOCRpg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Mar 14, 2017 at 5:58 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Fri, 10 Mar 2017 19:43:27 +0100, Peter Seiderer wrote:
>
>> On Wed,  8 Mar 2017 20:35:48 -0500, Danomi Manchego <danomimanchego123@gmail.com> wrote:
>>
>> > Currently, qt.mk installs DejaVu/Vera TrueType fonts if freetype
>> > support is available, either from Qt or from the system freetype.
>> > However, there are lots of fonts that can be used with Qt, both
>> > within Qt (the prerendered fonts) and outside of Qt (in buildroot's
>> > font area). So it seems appropriate to expose a switch to enable
>> > the installation of the TrueType fonts, conditioned on freetype
>> > availability. At least, it provides a similar level of selectability
>> > as already exists with the prerendered fonts (micro, fixed, helvetica,
>> > etc.), and in some cases may solve problems where setting fonts
>> > by family and attribute is complicated by DejaVu competing with
>> > fonts that were actually selected in the buildroot menu.
>>
>> Very detailed explanation for your reasoning, maybe stuff for a
>> cover-letter?
>
> I really disagree with this. The contents of cover letters disappear
> in the dark caves of the mailing list archives, while commit logs can
> very easily be found when looking at the history of the changes on a
> package. So I very, very much prefer to have detailed commit logs
> rather than everything in the cover letter and very terse commit logs.

I'm inclined to agree, but I'm told that I'm long-winded sometimes, so
I deferred to Peter.  I'll spin a v3 with a tweaked comment.

Danomi -


> I've seen the v2 of Danomi, and now I'm like "why do we want this?".
>
>> Subject: qt: add truetype font installation option
>>
>> Make truetype font installation optional.
>>
>> is detailed enough?
>
> No, it's not :)
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
