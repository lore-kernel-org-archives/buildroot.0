From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Jan 2017 23:20:25 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-01-24
In-Reply-To: <1485806342.3759.3.camel@embedded.rocks>
References: <20170125073013.D171D20CD4@mail.free-electrons.com>
 <1485378342.7516.1.camel@embedded.rocks>
 <20170125211534.dugtv6byofg3wvg5@tarshish>
 <CAHXCMM+cL0UnnfhgFTtkeC7L+jRh8s=tr-U5CTC0YZxzUBb4bA@mail.gmail.com>
 <1485722254.4549.1.camel@embedded.rocks>
 <20170129211155.f6sebtrdmsrwb2yw@tarshish>
 <1485806342.3759.3.camel@embedded.rocks>
Message-ID: <20170130212025.a5mmf5kfig3kgngo@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

On Mon, Jan 30, 2017 at 08:59:02PM +0100, J?rg Krause wrote:
> On Sun, 2017-01-29 at 23:11 +0200, Baruch Siach wrote:
> > Hi J?rg,
> > 
> > On Sun, Jan 29, 2017 at 09:37:34PM +0100, J?rg Krause wrote:
> > > On Thu, 2017-01-26 at 12:04 +0100, Samuel Martin wrote:
> > > > On Wed, Jan 25, 2017 at 10:15 PM, Baruch Siach <baruch@tkos.co.il
> > > > wrote:
> > > > > On Wed, Jan 25, 2017 at 10:05:42PM +0100, J?rg Krause wrote:
> > > > > > Unfortunately I cannot reproduce this issue. Is it a rpath
> > > > > > issue?
> > > > > > cmake links a test program with host zlib:
> > > > 
> > > > Note: I'm not able to reproduce the error either.
> > > 
> > > I wonder, what makes the difference to be able to reproduce the
> > > issue.
> > 
> > See http://lists.busybox.net/pipermail/buildroot/2017-January/182237.html.
> 
> I setup a Debian and Scientific Linux system yesterday, but I still
> cannot reproduce the build issue.

Do you have lib32z1 installed?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
