From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 26 Apr 2015 21:37:43 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/libical: bump version to
 v1.0.1, switch to cmake
In-Reply-To: <XnsA488CFC59E487berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1430072275-26451-1-git-send-email-bernd.kuhls@t-online.de>
 <20150426182108.GN2258@tarshish>
 <XnsA488CFC59E487berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20150426183743.GO2258@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Apr 26, 2015 at 08:25:29PM +0200, Bernd Kuhls wrote:
> Baruch Siach <baruch@tkos.co.il> wrote in 
> news:20150426182108.GN2258 at tarshish:
> >> v2: adjust comment in Config.in, add note about cmake switch in commit
> >>     message (Baruch)
> > 
> > Are you sure?
> 
> yes, take a look at the patch subject ;)

Ah, I haven't noticed that. But actually I was expecting something a little 
more elaborated in the commit log body. Something like:

From install.txt:

  Libical v1.0 and above uses the CMake buildsystem.
  The autoconf build system has been removed and is no longer supported.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
