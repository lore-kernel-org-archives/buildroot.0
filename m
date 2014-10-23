From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 23 Oct 2014 16:42:13 -0300
Subject: [Buildroot] Question about native tools.
In-Reply-To: <F9C551623D2CBB4C9488801D14F864C698E46CB3@ex-mb1.corp.adtran.com>
References: <F9C551623D2CBB4C9488801D14F864C698E46BA4@ex-mb1.corp.adtran.com>
 <5449488C.4070901@vanguardiasur.com.ar>
 <F9C551623D2CBB4C9488801D14F864C698E46CB3@ex-mb1.corp.adtran.com>
Message-ID: <54495A15.9020408@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/23/2014 03:42 PM, ANDY KENNEDY wrote:
> I see in that thread a vote to keep it and a vote to remove it.
> 
> So, given the split ballot, it was decided to remove it.

It wasn't quite split, i never chipped in because my mind was already
made that it made no sense (call it apathy).

> Before Peter or Thomas asks, no I really do NOT have the time to
> maintain this in BuildRoot (I'd have to give up sleeping entirely),
> so, no, I don't want it bad enough to maintain it.  :))) I do,
> however, want it bad enough for one of you to maintain it :))))!!

As Thomas said it requires a great amount of effort to get there and
keep maintaining it later, it's not just toolchain components, it's like
every package that install to staging.
AFAIK it's not an undertaking any of the long time/big contributors
wants to take on free time because we don't see the point in doing so
and/or find it interesting.
You could just use a gentoo stage3 tarball to do devel stuff, normally
if you've got the cpu/ram resources you've got enough storage as well.
Regards.
