From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Nov 2012 08:36:46 +0100
Subject: [Buildroot] Various problem using buildroot-2012.05
In-Reply-To: <50A03D29.7070608@petroprogram.com>
References: <1340005565.16617.YahooMailClassic@web161402.mail.bf1.yahoo.com>
 <20120618103657.721db39b@skate> <qaol7k.eta.ln@bernd-kuhls.de>
 <509E69FD.2000804@petroprogram.com> <50A02B0C.4000107@mind.be>
 <50A03D29.7070608@petroprogram.com>
Message-ID: <20121112083646.2714c2ab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stefan,

On Mon, 12 Nov 2012 02:04:57 +0200, Stefan Fr?berg wrote:

> Another "little" difficult case is Python.
> 
> Even tought Python uses autotools, it (and Perl) will always be the
> worst cross-compile
> friendly citizens in my book.
> Way back, before buildroot, I tried many times to cross-compile it in
> Mingw32 environment and it was an
> absolute nightmare. With Perl I had even less luck.

So far, Python has been relatively manageable and what have a bunch of
Python modules that work.

> Every time I find an interesting open source project that I would like
> to try and cross-compile,
> I will make an silent prayer to God's of programmers that the build
> system that is revealed from
> tarball will be a GNU autoconf script (or even cmake one for God's
> sake) and not
> some hodge-bodge, custom made, configuration nightmare.

I agree that custom made build systems are a pain. However, from my
(possibly naive and idealist) perspective, the right solution to these
is to fix them rather than workarounding the problem using native
compilation on the target.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
