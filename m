From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 20 Jul 2015 13:49:14 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-19
In-Reply-To: <20150720124408.GM13027@tarshish>
References: <20150720063017.2400B101C74@stock.ovh.net>
 <CA+BsyQ4=X7ZA0LTiHNo4SAC2FotUJGL+3xb1LgjNjFUQCUBk+g@mail.gmail.com>
 <20150720124408.GM13027@tarshish>
Message-ID: <CA+BsyQ7zi_ni7qV4X5m07YYJ=eF3YdmQghX+GBcZcZAUtdeUGA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> Welcome. Looking into autobuild issues and posting patches is a great way
> to
> start. Make sure to read
>
> http://nightly.buildroot.org/manual.html#_analyzing_and_fixing_autobuild_failures
> before you start. An overlap in autobuild issues fixing happen at times,
> but
> it's quite rare. Anyone is allowed and encouraged to post build failure
> fixes,
> as well as run-time failures, though the autobuilder currently doesn't
> catch
> failures of the latter type.
>

Sounds good. I will follow the instructions as above.

It most likely has to do with recent sourceforge infrastructure issues
> (
> http://sourceforge.net/blog/sourceforge-infrastructure-and-service-restoration/
> ).
>

Agreed, that must be the cause.

I noticed there are around 200 packages that download from sourceforge. I
didn't do an exhaustive investigation but noticed that zlib is fetched from
there. Might it be better to fetch this (and other packages) from their
authoritative site, where one exists ? (in zlib's case,
http://zlib.net/zlib-1.2.8.tar.gz ?)

[sourceforge has been in the news for other reasons lately .. I get the
general feeling that it is a resource that is not long for this world .. ]

Cheers

Brendan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150720/632462fa/attachment.html>
