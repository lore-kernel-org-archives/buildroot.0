From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 28 Nov 2015 21:43:36 +0200
Subject: [Buildroot] [PATCH next 1/2] at: bump version to 3.1.16
In-Reply-To: <20151125155835.67264729@free-electrons.com>
References: <1448458575-60714-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151125155835.67264729@free-electrons.com>
Message-ID: <20151128194336.GA2193@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 25, 2015 at 03:58:35PM +0100, Thomas Petazzoni wrote:
> On Wed, 25 Nov 2015 13:36:14 +0000, Vicente Olivert Riera wrote:
> > - Bump version to 3.1.16
> > - Update the hash value
> > - Remove upstreamed patches:
> >   0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
> >   0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
> > - Tweak patches for the new version:
> >   0004-Makefile.in-replace-IROOT-by-DESTDIR.patch
> >   0005-Makefile.in-make-install-fix.patch
> > 
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > ---
> >  ...c-remove-manual-compiler-check-with-AC_TR.patch | 33 ------------------
> >  ...-Makefile.in-add-LDFLAGS-to-linking-stage.patch | 38 ---------------------
> >  ...0004-Makefile.in-replace-IROOT-by-DESTDIR.patch | 39 ++++++++++++++--------
> >  package/at/0005-Makefile.in-make-install-fix.patch | 34 +++++++++++++------
> >  package/at/at.hash                                 |  6 ++--
> >  package/at/at.mk                                   |  2 +-
> >  6 files changed, 52 insertions(+), 100 deletions(-)
> >  delete mode 100644 package/at/0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
> >  delete mode 100644 package/at/0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
> 
> Both applied to next, thanks.

I don't see these patches in current next.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
