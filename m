From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 15:10:44 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-19
In-Reply-To: <CA+BsyQ7zi_ni7qV4X5m07YYJ=eF3YdmQghX+GBcZcZAUtdeUGA@mail.gmail.com>
References: <20150720063017.2400B101C74@stock.ovh.net>
 <CA+BsyQ4=X7ZA0LTiHNo4SAC2FotUJGL+3xb1LgjNjFUQCUBk+g@mail.gmail.com>
 <20150720124408.GM13027@tarshish>
 <CA+BsyQ7zi_ni7qV4X5m07YYJ=eF3YdmQghX+GBcZcZAUtdeUGA@mail.gmail.com>
Message-ID: <20150720151044.1b5cd445@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Brendan Heading,

On Mon, 20 Jul 2015 13:49:14 +0100, Brendan Heading wrote:

> I noticed there are around 200 packages that download from sourceforge. I
> didn't do an exhaustive investigation but noticed that zlib is fetched from
> there. Might it be better to fetch this (and other packages) from their
> authoritative site, where one exists ? (in zlib's case,
> http://zlib.net/zlib-1.2.8.tar.gz ?)
> 
> [sourceforge has been in the news for other reasons lately .. I get the
> general feeling that it is a resource that is not long for this world .. ]

Yes, generally speaking identifying all our packages that are still
hosted on SourceForge or Google Code, and finding if there is an
alternate download location would be very good. Patches going in this
direction are welcome. However, beware that the new location should be
somewhat "official": we don't want to use some random Github fork as a
replacement for a Sourceforge / Google Code download.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
