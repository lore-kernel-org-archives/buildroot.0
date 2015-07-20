From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 20 Jul 2015 13:30:24 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-19
In-Reply-To: <20150720063017.2400B101C74@stock.ovh.net>
References: <20150720063017.2400B101C74@stock.ovh.net>
Message-ID: <CA+BsyQ4=X7ZA0LTiHNo4SAC2FotUJGL+3xb1LgjNjFUQCUBk+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20 July 2015 at 07:30, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Build statistics for 2015-07-19
> ===============================
>
>         success : 230
>        failures : 125
>        timeouts : 6
>           TOTAL : 361
>
> Classification of failures by reason
> ====================================
>

[..]

hi all, new to the buildroot list - I have some free time, and I've been
using buildroot for a while in projects with my previous employer, so I'm
keen to repay some of the time and effort it has saved me in the past. This
list of bugs looks like a great place to start ;)

Shall I just begin to submit patches or are there likely to be people
already looking at these issues ?

The fan-ctrl failure for all arches looks like it might have been a
sourceforge problem. The package is fetched from a sourceforge svn
repository (regular package tarball downloads from sourceforge look OK).
Maybe sourceforge have been fiddling with things, I haven't checked.

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150720/0dd6d7c7/attachment.html>
