From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 21 Nov 2012 11:18:06 +0100
Subject: [Buildroot] [PATCH] external-toolchain: add Sourcery CodeBench
 ARM 2012.09
In-Reply-To: <50AA8B82.6010609@mind.be>
References: <1353324554-23461-1-git-send-email-fabio.porcedda@gmail.com>
 <50AA8B82.6010609@mind.be>
Message-ID: <CAHkwnC-F5=f50THADAVjWUCueB9WfEuYAfhYv-pmi+QzAvEi3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 19, 2012 at 8:41 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 19/11/12 12:29, Fabio Porcedda wrote:
>>
>> I've added the "depends on BROKEN" because this toolchain
>> breaks linux kernel arm builds:
>> "arch/arm/lib/copy_template.S:247: Error: selected processor
>>   does not support ARM mode `ldralt r4,[r1],#4'"
>
>
>  Then why would we add support for that toolchain to buildroot?

You are right, that toolchain it's not useful to buildroot.
At least that email can be useful as an advice for who want to use
that toolchain with buildroot.

I've opened a new discussion about this bug on the Mentor's Forum:
http://communities.mentor.com/mgcx/message/36184

Regards
--
Fabio Porcedda
Software Developer - R&D Cagliari
Telit Communications S.p.A.
