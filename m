From: Guo Ren <guoren@kernel.org>
Date: Mon, 27 May 2019 16:11:43 +0800
Subject: [Buildroot] [PATCH V2 7/9] package/glibc: Add C-SKY support
In-Reply-To: <20190526225715.5c05bd21@windsurf>
References: <1557305915-11247-1-git-send-email-guoren@kernel.org>
 <1557305915-11247-7-git-send-email-guoren@kernel.org>
 <20190526225715.5c05bd21@windsurf>
Message-ID: <20190527081143.GC10769@guoren-Inspiron-7460>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, May 26, 2019 at 10:57:15PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed,  8 May 2019 16:58:33 +0800
> guoren at kernel.org wrote:
> 
> > From: Guo Ren <ren_guo@c-sky.com>
> > 
> > Add glibc build for C-SKY Architecture.
> > 
> > Signed-off-by: Guo Ren <ren_guo@c-sky.com>
> > ---
> >  package/glibc/glibc.hash                | 2 ++
> >  package/glibc/glibc.mk                  | 3 +++
> >  toolchain/toolchain-buildroot/Config.in | 2 +-
> >  3 files changed, 6 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> > index 5316f03..6e47559 100644
> > --- a/package/glibc/glibc.hash
> > +++ b/package/glibc/glibc.hash
> > @@ -1,2 +1,4 @@
> >  # This hash file is not used; instead, update the
> >  # hash files in the per-version sub-directories.
> 
> Well, did you see this comment ? If you did, why did you add some
> hashes to this file ? :-)
Ok, follow the rules.

Best Regards
 Guo Ren
