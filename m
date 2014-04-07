From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 7 Apr 2014 20:12:07 +0300
Subject: [Buildroot] [PATCH] latencytop: disable static build
In-Reply-To: <20140407175300.4b6111f1@skate>
References: <4cc42edb1d6c9e7d6c156bb56fb744ec84ff9ae0.1396879234.git.baruch@tkos.co.il>
 <20140407175300.4b6111f1@skate>
Message-ID: <20140407171207.GJ4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, Apr 07, 2014 at 05:53:00PM +0200, Thomas Petazzoni wrote:
> On Mon,  7 Apr 2014 17:00:34 +0300, Baruch Siach wrote:
> > The Makefile of latencytop doesn't take static linking into account when
> > calling pkg-config for glib-2.0. Disable static build of latencytop.
> 
> Well, there are *lots* of packages that don't take into account static
> linking with pkg-config. There is even a patch proposed to improve this
> situation: http://patchwork.ozlabs.org/patch/326741/.

Thanks for the tip. I'll test this patch and report.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
