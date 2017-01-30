From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Mon, 30 Jan 2017 20:59:02 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <20170129211155.f6sebtrdmsrwb2yw@tarshish>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
 <1485722254.4549.1.camel@embedded.rocks>
 <20170129211155.f6sebtrdmsrwb2yw@tarshish>
Message-ID: <1485806342.3759.3.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, 2017-01-29 at 23:11 +0200, Baruch Siach wrote:
> Hi J?rg,
> 
> On Sun, Jan 29, 2017 at 09:37:34PM +0100, J?rg Krause wrote:
> > On Thu, 2017-01-26 at 12:04 +0100, Samuel Martin wrote:
> > > On Wed, Jan 25, 2017 at 10:15 PM, Baruch Siach <baruch@tkos.co.il
> > > >
> > > wrote:
> > > > On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> > > > > Unfortunately I cannot reproduce this issue. Is it a rpath
> > > > > issue?
> > > > > cmake links a test program with host zlib:
> > > 
> > > Note: I'm not able to reproduce the error either.
> > 
> > I wonder, what makes the difference to be able to reproduce the
> > issue.
> 
> See http://lists.busybox.net/pipermail/buildroot/2017-January/182237.
> html.

I setup a Debian and Scientific Linux system yesterday, but I still
cannot reproduce the build issue. However, I've found out that mbedlts
is never build with zlib support in Buildroot [1].

[1] http://patchwork.ozlabs.org/patch/721218/
