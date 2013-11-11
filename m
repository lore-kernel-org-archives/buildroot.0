From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:59:18 +0100
Subject: [Buildroot] [PATCH 4/4] pkg-infra: add user-supplied step-hooks
In-Reply-To: <CAAXf6LWTb50WrAJybtH-=cJ-+UJb6FrQ=9+EKr6M=U2eJbjfqA@mail.gmail.com>
References: <cover.1384182040.git.yann.morin.1998@free.fr>
 <8e74486ebbb0c14cd011d2143b988d261f592f7a.1384182040.git.yann.morin.1998@free.fr>
 <CAAXf6LWTb50WrAJybtH-=cJ-+UJb6FrQ=9+EKr6M=U2eJbjfqA@mail.gmail.com>
Message-ID: <CAHXCMM+GOmMkwcE+L9pZBLnjJCu_hgpRyc4OsDsha3p=ref=Cw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/11/11 Thomas De Schampheleire <patrickdepinguin@gmail.com>

> On Mon, Nov 11, 2013 at 4:03 PM, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Allow user to supply their own step-hooks by passing a variable
> > on the make command-line:
> >     make BR2_INSTRUMENTATION_SCRIPTS=/path/to/my/script
> >
> > This can be usefull to run site-specific actions at each step of the
> > build process, such as logging installed, removed or modified files,
> > do sanity checks on installed files...
> >
> > It is possible to call more than one script, by passing a space-separated
> > lists of scripts to call.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> > ---
> >  docs/manual/debugging-buildroot.txt | 33
> +++++++++++++++++++++++++++++++++
> >  docs/manual/developer-guide.txt     |  2 ++
> >  package/pkg-generic.mk              |  9 +++++++++
> >  3 files changed, 44 insertions(+)
> >  create mode 100644 docs/manual/debugging-buildroot.txt
>
> Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131111/9fafa53d/attachment.html>
