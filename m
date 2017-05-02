From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 2 May 2017 08:04:52 +0300
Subject: [Buildroot] [PATCH v2] daemon: new package
In-Reply-To: <47ac8a79-3586-a052-77df-3a4759c5e8d8@gmail.com>
References: <a92dc5869d0e5e3868f928293c8d68f2558728ef.1493668995.git.baruch@tkos.co.il>
 <47ac8a79-3586-a052-77df-3a4759c5e8d8@gmail.com>
Message-ID: <20170502050452.4iofjilonggc23gw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, May 01, 2017 at 11:28:11PM +0200, Romain Naour wrote:
> Le 01/05/2017 ? 22:03, Baruch Siach a ?crit :
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> > v2: add target installation (thanks Romain)
> > ---
> 
> > new file mode 100644
> > index 000000000000..30954e77edc7
> > --- /dev/null
> > +++ b/package/daemon/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_DAEMON
> > +	bool "daemon"
> > +	depends on BR2_USE_MMU # fork()
> 
> It also needs thread support:
> 
> In file included from libslack/coproc.c:56:0:
> libslack/std.h:102:21: fatal error: pthread.h: No such file or directory

Thanks for your thorough review.

I'll fix and resubmit.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
