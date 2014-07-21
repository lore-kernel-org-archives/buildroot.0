From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 21:27:00 +0200
Subject: [Buildroot] [OpenWrt-Devel] uClibc-ng
In-Reply-To: <CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
References: <20140720191326.GD4431@waldemar-brodkorb.de>
 <CAGVrzcZxcgP+yerqW=1ZDrmgiFmOz9eTwFB2KvZ6Xt2MJpbpDA@mail.gmail.com>
 <20140721204239.61b225fe@free-electrons.com>
 <CAGVrzcZja2DTrJGA2QWsMH=2GgUBuouSetK+-cUdXY7XbyA8SA@mail.gmail.com>
Message-ID: <20140721212700.41e29653@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Florian Fainelli,

On Mon, 21 Jul 2014 11:55:21 -0700, Florian Fainelli wrote:

> > On my side, I fully support Waldemar's fork. The last uClibc release is
> > more than 2 years old, and Bernhard has never been answering to *any*
> > of the e-mails asking to do a release, sent since September 2013 or so.
> > At this point, I think there is absolutely no hope to see any action
> > being done by the existing uClibc community in terms of doing stable
> > releases, and this case, the lever that open-source licenses provide is
> > simple: fork. That's what Waldemar has done, and it's good.
> 
> To speak my mind, I think uClibc has no future in the next 2 or 3
> years, musl is a much more active project, with multiple embedded
> projects starting to use it, on the other end, (e)glibc has remedied
> its own problems and its useful again.
> 
> No MMU architectures are becoming less and less popular, and the cost
> for larger flash storage mediums keeps decreasing, so all these key
> selling features (noMMU support and reduced memory footprint) that
> uClibc has will soon no longer be any useful to it.

I don't really think noMMU architectures are becoming less and less
popular. There is actually a whole new generation of
Cortex-M3/Cortex-M4 based processors that are capable of running Linux
and that offer really nice power management capabilities.

> Bottom line is, I believe uClibc is a (relatively speaking) dead
> project already, forking it might be useful to keep the existing user
> base alive, but I expect all of them to transition to something active
> and maintained, whether that's glibc or musl.

I also agree that probably not that much is going to appear in uClibc,
especially with the currently slow release cycle. However, a C library
is something that needs to be maintained (as the significant number of
uClibc patches that we all carry around indicates), and therefore
having a central upstream that is alive remains useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
