From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Nov 2014 10:16:51 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-19
In-Reply-To: <20141120090935.GD2220@tarshish>
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
 <20141120090935.GD2220@tarshish>
Message-ID: <20141120101651.03f442df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Thu, 20 Nov 2014 11:09:35 +0200, Baruch Siach wrote:
> Hi Thomas,
> 
> On Thu, Nov 20, 2014 at 09:44:07AM +0100, Thomas Petazzoni wrote:
> > >      powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dc0dd9e878edd2b359900d02e1d53d294321c00b/
> > >          arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0b8411482def8fdfba0aaaa19be01a477707d874/
> > 
> > configure: error: No curses/termcap library found
> > 
> > Why don't we simply add host-ncurses to the host-mysql dependencies?
> > Nathaniel, can you reproduce this issue on your autobuilder, and see if
> > adding host-ncurses to the dependencies of host mysql fixes the problem?
> 
> It seem commit d81d202e97258e (mysql: host variant needs ncurses as well) by 
> Peter should fix this issue.

Ah, indeed, missed this one. We'll see if host-mysql issues related to
this continue to pop up or not, but I suspect Peter's commit should fix
those.

Thanks for noticing this!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
