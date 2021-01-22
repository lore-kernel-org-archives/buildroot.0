From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Fri, 22 Jan 2021 15:06:16 +0100
Subject: [Buildroot] [PATCH] package/vuejs: bump version to 3.0.5
In-Reply-To: <20210121223806.68e2fa5a@windsurf.home>
References: <20210120144901.604128-1-johan.oudinet@gmail.com>
 <20210121223806.68e2fa5a@windsurf.home>
Message-ID: <CAJtjsKby4iDaXKL3w4nTG5CyvLVvz_7wTi_BYYYOz3_xk8+Ssw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 21, 2021 at 10:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Wed, 20 Jan 2021 15:49:01 +0100
> Johan Oudinet <johan.oudinet@gmail.com> wrote:
>
> > The vuejs developers have changed the way this package is distributed.
> > The tarball containing the dist files does not contain anymore the
> > LICENSE file. The license remains MIT but until it is reintroduced in
> > the tarball, we have to skip the license file hash verification.
> >
> > Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> > ---
> >  package/vuejs/vuejs.hash | 3 +--
> >  package/vuejs/vuejs.mk   | 9 ++++-----
> >  2 files changed, 5 insertions(+), 7 deletions(-)
>
> Applied to master, thanks. Did you notify upstream about the missing
> license file ?

Thanks Thomas. Yes I did, here:
https://github.com/vuejs/vue-next/issues/2650

-- 
Johan
