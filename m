From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 7 Oct 2015 20:41:23 +0300
Subject: [Buildroot] [PATCH] picocom: bump to version 2.0
In-Reply-To: <20151007172457.GJ2375@tarshish>
References: <1444237316-52377-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151007172457.GJ2375@tarshish>
Message-ID: <20151007174123.GK2375@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Wed, Oct 07, 2015 at 08:24:57PM +0300, Baruch Siach wrote:
> On Wed, Oct 07, 2015 at 06:01:56PM +0100, Vicente Olivert Riera wrote:
> > - Bump to version 2.0
> > - Switch the download site to GitHub
> > - Apply a patch to fix a missing define. Pull request sent upstream:
> >   https://github.com/npat-efault/picocom/pull/31
> 
> Where is that patch?

Missed the PICOCOM_PATCH variable. Sorry for the noise.

baruch

> > - Add a hash file
> > - Rewrap the help text to 72 characters length
> > - Change the official website
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > ---
> >  package/picocom/Config.in    |    7 +++----
> >  package/picocom/picocom.hash |    3 +++
> >  package/picocom/picocom.mk   |    7 ++++---
> >  3 files changed, 10 insertions(+), 7 deletions(-)
> >  create mode 100644 package/picocom/picocom.hash

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
