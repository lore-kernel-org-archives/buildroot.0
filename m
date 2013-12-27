From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 27 Dec 2013 15:57:21 +0200
Subject: [Buildroot] Analysis of build failures, december 26th
In-Reply-To: <20131227143326.0811a6af@skate>
References: <20131227073009.1283F101A83@stock.ovh.net>
 <201312271531.46191.fatih.asici@gmail.com> <20131227143326.0811a6af@skate>
Message-ID: <201312271557.21650.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 27 December 2013 15:33:26 Thomas Petazzoni wrote:
> Dear Fatih A??c?,
> 
> On Fri, 27 Dec 2013 15:31:46 +0200, Fatih A??c? wrote:
> > On Friday 27 December 2013 11:35:11 Thomas Petazzoni wrote:
> > > >        sh4 |                  qt5base-5.2.0 | NOK |
> > > >
> > > >http://autobuild.buildroot.net/results/a249b0cd5b20a2c3eee34b585cd58d4
> > > >a03 a9338e/
> > > 
> > > ../../../3rdparty/sqlite/sqlite3.c:23535:42: error: 'posix_fallocate'
> > > undeclared here (not in a function)
> > > 
> > > I think we had this problem in the past. Note that the SH4 toolchain is
> > > older than other toolchain (generated with Buildroot 2013.05, while
> > > other toolchains are generated with Buildroot 2013.11-rc2).
> > > 
> > > Fatih, any idea?
> > 
> > posix_fallocate patch was removed while bumping to 5.2.0. Sent a patch to
> > get it back.
> 
> Thanks. Is there a chance to get this patch upstream somehow?

It is already upstreamed; but 5.2.0 didn't include it because of the feature 
freeze.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131227/697e5ab8/attachment.html>
