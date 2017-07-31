From: Petar Koretic <petar.koretic@qaap.io>
Date: Mon, 31 Jul 2017 19:48:16 +0200
Subject: [Buildroot] [PATCH 1/1] qt5declarative: backport 'Fix alignment
 issue on ARMv7' patch to 5.9.1
In-Reply-To: <CAKdiq5_+hC1qMckjeahyp6KC_Q+035A0-8W1C5m3LuuF5crEoA@mail.gmail.com>
References: <20170731171359.32471-1-petar.koretic@qaap.io>
 <20170731193331.692187b7@windsurf.home>
 <CAKdiq5_+hC1qMckjeahyp6KC_Q+035A0-8W1C5m3LuuF5crEoA@mail.gmail.com>
Message-ID: <CAKdiq5_AxzACKggy9yd0m5ZfdXxLXP1g3QEJrSzxH4FpxpVpmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doesn't affect or apply to 5.6, if that was actually the question.

Best regards,
Petar

On Mon, Jul 31, 2017 at 7:44 PM, Petar Koretic <petar.koretic@qaap.io>
wrote:

> Hi Thomas.
>
> Thanks for the information.
> It does affect and applies to Qt 5.8 (and 5.9.0) as well, just tested this
> to confirm it.
> Commit message needs fixing then, sorry.
>
> Best regards,
> Petar
>
>
> On Mon, Jul 31, 2017 at 7:33 PM, Thomas Petazzoni <thomas.petazzoni@free-
> electrons.com> wrote:
>
>> Hello,
>>
>> On Mon, 31 Jul 2017 19:13:59 +0200, Petar Koretic wrote:
>> > This resolves a QML issues reported in
>> > https://bugreports.qt.io/browse/QTBUG-61522 that will be fixed in the
>> 5.9.2.
>> >
>> > Signed-off-by: Petar Koretic <petar.koretic@qaap.io>
>> > ---
>> >  .../0003-Fix-alignment-issue-on-ARMv7.patch        | 34
>> ++++++++++++++++++++++
>> >  1 file changed, 34 insertions(+)
>> >  create mode 100644 package/qt5/qt5declarative/000
>> 3-Fix-alignment-issue-on-ARMv7.patch
>> >
>> > diff --git a/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
>> b/package/qt5/qt5declarative/0003-Fix-alignment-issue-on-ARMv7.patch
>>
>> Does this patch applies only to 5.9.1 ? If so, it should go in
>> package/qt5/qt5declarative/5.9.1/.
>>
>> I can fixup the patch, just tell me if this issue is only applicable to
>> 5.9.1 (I guess it is the case, but I prefer to ask).
>>
>> Thanks,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170731/aef86dec/attachment.html>
