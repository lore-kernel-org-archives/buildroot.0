From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 20 Nov 2014 11:09:35 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-19
In-Reply-To: <20141120094407.4b487379@free-electrons.com>
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
Message-ID: <20141120090935.GD2220@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 20, 2014 at 09:44:07AM +0100, Thomas Petazzoni wrote:
> >      powerpc |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/dc0dd9e878edd2b359900d02e1d53d294321c00b/
> >          arm |              host-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/0b8411482def8fdfba0aaaa19be01a477707d874/
> 
> configure: error: No curses/termcap library found
> 
> Why don't we simply add host-ncurses to the host-mysql dependencies?
> Nathaniel, can you reproduce this issue on your autobuilder, and see if
> adding host-ncurses to the dependencies of host mysql fixes the problem?

It seem commit d81d202e97258e (mysql: host variant needs ncurses as well) by 
Peter should fix this issue.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
