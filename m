From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 24 Jul 2013 10:16:34 +0300
Subject: [Buildroot] netcat package?
In-Reply-To: <20130724070700.GA6323@zuhnb712.ap.bm.net>
References: <20130724032345.GB13697@zuhnb712.ap.bm.net>
 <20130724033444.GI5509@tarshish>
 <20130724070700.GA6323@zuhnb712.ap.bm.net>
Message-ID: <20130724071634.GK5509@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Woody Wu,

On Wed, Jul 24, 2013 at 03:07:01PM +0800, Woody Wu wrote:
> On Wed, Jul 24, 2013 at 06:34:44AM +0300, Baruch Siach wrote:
> > On Wed, Jul 24, 2013 at 11:23:45AM +0800, Woody Wu wrote:
> > > Is there a netcat package in buildroot?  I did not find it on the menu,
> > > but just think buildroot should already have this famous tool.
> > 
> > You should find the netcat package under "Networking applications". Make sure 
> > to select "Show packages that are also provided by busybox", otherwise the 
> > netcat package is not shown in the menu.
> 
> Thanks baruchy.  When enabled 'Show packages provided by busybox' and
> selected the 'nc', what 'nc' program will I finally get? I mean, the
> busybox one or standalone one?

That depends on whether you have netcat enabled in your busybox build (just 
run 'busybox' to see what applets you have enabled), and whether your 
/usr/bin/nc points to busybox, or is a real executable.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
