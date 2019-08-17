From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Sat, 17 Aug 2019 20:58:05 +0200
Subject: [Buildroot] [PATCH] autoconf-archive: bump version to
 v2019.01.06
In-Reply-To: <20190817145755.24bc91aa@windsurf.home>
References: <20190816071617.6711-1-brgl@bgdev.pl>
 <20190817145755.24bc91aa@windsurf.home>
Message-ID: <CAMRc=MfV+s_kHUoV9bmS0jPQ-x8u3DxqP1oquWZmi97uEXGF=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sob., 17 sie 2019 o 14:57 Thomas Petazzoni
<thomas.petazzoni@bootlin.com> napisa?(a):
>
> Hello Bartosz,
>
> On Fri, 16 Aug 2019 09:16:17 +0200
> Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Update the version of autoconf-archive and drop the backported patch.
> >
> > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >  .../0001-AX_TLS-fix-syntax-error.patch        | 48 -------------------
> >  .../autoconf-archive/autoconf-archive.hash    |  2 +-
> >  package/autoconf-archive/autoconf-archive.mk  |  2 +-
> >  3 files changed, 2 insertions(+), 50 deletions(-)
> >  delete mode 100644 package/autoconf-archive/0001-AX_TLS-fix-syntax-error.patch
>
> Applied to next, thanks. Just one minor nit: we now like to have
> patches touching packages to have commit titles of the form
> "package/foo: do something", i.e with the "package/" prefix. I fixed
> that up when applying.
>

Got it. I'll remember next time.

Bart
