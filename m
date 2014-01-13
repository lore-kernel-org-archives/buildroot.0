From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 13 Jan 2014 10:23:38 +0200
Subject: [Buildroot] [PATCH v2 0/3] uclibc: build fixes for xtensa
 snapshot version
In-Reply-To: <20140113161308.356138d7@skate>
References: <cover.1389594195.git.baruch@tkos.co.il>
 <20140113161308.356138d7@skate>
Message-ID: <20140113082338.GJ4944@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Jan 13, 2014 at 04:13:08PM +0800, Thomas Petazzoni wrote:
> On Mon, 13 Jan 2014 08:26:11 +0200, Baruch Siach wrote:
> 
> > Baruch Siach (3):
> >   uclibc: bump xtensa snapshot version
> >   uclibc: xtensa: fix posix_spawn autoconf detection
> 
> Why is this patch xtensa specific?

It it not. It's uClibc snapshot specific, and I don't think that blindly 
applying this patch to any random snapshot version is a good idea. Only xtensa 
and arc have a fixed default uClibc snapshot version. arc uses its own uClibc 
git tree, so this patch can be applied there if it's considered useful (adding 
Mischa to Cc).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
