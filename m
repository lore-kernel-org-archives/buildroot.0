From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Sat, 7 Mar 2015 15:50:00 -0500
Subject: [Buildroot] [PATCH 0/7] General LTTng packages maintenance
In-Reply-To: <20150307085921.087c637a@free-electrons.com>
References: <1425663357-22541-1-git-send-email-eeppeliteloop@gmail.com>
 <20150306233246.11b83af2@free-electrons.com> <54FA4E1C.9080909@mind.be>
 <20150307085921.087c637a@free-electrons.com>
Message-ID: <CAB4xu_2987X_QpbusZowfA=UbNM0tU90xDz6vdTa2itBQFxGig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Mar 7, 2015 at 2:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Arnout Vandecappelle,
>
> On Sat, 07 Mar 2015 02:02:20 +0100, Arnout Vandecappelle wrote:
>
>>  For lttng-libust, I really think it's silly to rename it. Nobody will be
>> bothered by it.
>>
>>  Babeltrace on the other hand is more defendable. Are there any other packages
>> that we carry that produces traces that can be read by babeltrace?
>
> Not that I am aware of, but Philippe might have some more details about
> this.
>
>>  Note also that there always has been pushback from Peter against gratuitous
>> renaming.
>
> Yes, which is why I decided to not apply those patches for the moment.

I have no strong opinion on this, guys! I renamed those only for them
to be more consistent with the upstream project names.

I don't think any application other than LTTng in Buildroot produces traces
which can be decoded by Babeltrace, but Babeltrace is still an independent
project, reading CTF traces for the moment, also an independent format.

Phil

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
