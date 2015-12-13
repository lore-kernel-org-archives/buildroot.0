From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 13 Dec 2015 20:59:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libhdhomerun: new package
In-Reply-To: <e890kcx3eu.ln2@ID-313208.user.individual.net>
References: <1450004296-5335-1-git-send-email-bernd.kuhls@t-online.de>
 <20151213113342.GF2318@tarshish>
 <ve20kcx3eu.ln2@ID-313208.user.individual.net>
 <20151213120353.GG2318@tarshish>
 <e890kcx3eu.ln2@ID-313208.user.individual.net>
Message-ID: <20151213185911.GI2318@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Dec 13, 2015 at 02:43:10PM +0100, Bernd Kuhls wrote:
> Am Sun, 13 Dec 2015 14:03:53 +0200 schrieb Baruch Siach:
> > Agreed. But is this file really intended for target use? Most library
> > *_config files are only useful during build. What is the purpose of
> > hdhomerun_config?

Some digging shows that this is a configuration utility for the Silicon Dust 
HDHomeRun hardware. Debian ships it in a separate hdhomerun-config package.

> Honestly I do not know, so I sent v2 of my patch:
> http://patchwork.ozlabs.org/patch/556182/
> If someone misses hdhomerun_config a follow-up patch is needed ;)

Fair enough.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
