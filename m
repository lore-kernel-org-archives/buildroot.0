From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 5 Jun 2014 09:53:43 +0300
Subject: [Buildroot] [PATCH v6 0/4] rpi-userland/xbmc fixes
In-Reply-To: <a8809a02-4f3d-4671-a9dc-0c251445c498@email.android.com>
References: <1401923053-30292-1-git-send-email-s.martin49@gmail.com>
 <a8809a02-4f3d-4671-a9dc-0c251445c498@email.android.com>
Message-ID: <20140605065342.GE4193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Jun 05, 2014 at 08:45:16AM +0200, Yann E. MORIN wrote:
> (Grr... K9 drops the text in the quoted part)

Your text appears correctly in the plaintext part of your email 
(http://lists.busybox.net/pipermail/buildroot/2014-June/098501.html), but not 
the on HTML part 
(http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/86031).

baruch

> You forgot to propagate my tested-and-acked-tags to patches 1 and 3.
> 
> Regards,
> Yann E  MORIN.
> 
> On June 5, 2014 1:04:09 AM CEST, Samuel Martin <s.martin49@gmail.com> wrote:
> >Hi all,
> >
> >Here is just more fixes about rpi-userland/xbmc and all.
> >
> >Yours,
> >Samuel
> >
> >Samuel Martin (3):
> >  xbmc: fix missing libraries from rpi-userland
> >  rpi-userland: add patch fix missing libvcilcs install rules
> >  rpi-userland: cleanup *_CONF_OPT
> >
> >Yann E. MORIN (1):
> >  package/libcec: fix missing libraries from rpi-userland
> >
> > package/libcec/libcec.mk                           |  1 +
> >...vmcs_host-add-install-rules-for-libvcilcs.patch | 23
> >++++++++++++++++++++++
> > package/rpi-userland/rpi-userland.mk               |  2 +-
> > package/xbmc/xbmc.mk                               |  3 ++-
> > 4 files changed, 27 insertions(+), 2 deletions(-)
> >create mode 100644
> >package/rpi-userland/rpi-userland-003-interface-vmcs_host-add-install-rules-for-libvcilcs.patch
> >
> >--
> >2.0.0

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
