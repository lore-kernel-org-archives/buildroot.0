From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 17 Apr 2012 16:29:41 +0300
Subject: [Buildroot] [PATCH] Add libapr-package
In-Reply-To: <op.wcwvmkpg705kjs@rico>
References: <1334668612-8220-1-git-send-email-bachmann@tofwerk.com>
 <20120417132030.GG3629@sapphire.tkos.co.il>
 <op.wcwvmkpg705kjs@rico>
Message-ID: <20120417132941.GH3629@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rico,

On Tue, Apr 17, 2012 at 03:26:34PM +0200, Rico Bachmann wrote:
> Am 17.04.2012, 15:20 Uhr, schrieb Baruch Siach <baruch@tkos.co.il>:
> >On Tue, Apr 17, 2012 at 03:16:52PM +0200, Rico Bachmann wrote:
> >>Signed-off-by: Rico Bachmann <bachmann@tofwerk.com>
> >>---
> >> package/Config.in     |    1 +
> >> package/apr/Config.in |    7 +++++++
> >> package/apr/apr.mk    |   18 ++++++++++++++++++
> >> 3 files changed, 26 insertions(+), 0 deletions(-)
> >> create mode 100644 package/apr/Config.in
> >> create mode 100644 package/apr/apr.mk
> >>
> >>diff --git a/package/Config.in b/package/Config.in
> >>index 4c6d4d8..ceb5f6d 100644
> >>--- a/package/Config.in
> >>+++ b/package/Config.in
> >>@@ -376,6 +376,7 @@ source "package/fftw/Config.in"
> >> source "package/libargtable2/Config.in"
> >> source "package/argp-standalone/Config.in"
> >> source "package/boost/Config.in"
> >>+source "package/libapr/Config.in"
> >
> >This doesn't match the location of Config.in below. Is this patch build
> >tested?
> 
> Ah i forgot about the package/Config.in
> I correct the path

The subject line of this patch should also change as well.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
