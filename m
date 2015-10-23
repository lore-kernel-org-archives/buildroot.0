From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 23 Oct 2015 22:25:15 +0200
Subject: [Buildroot] [PATCH 02/21 v2] docs/manual: document $(FOO_PKGDIR)
In-Reply-To: <CAHXCMMLLM-CCZrAgQ-uPNVz1Ly=q5d61Psv6KMDeV795xZ8mqA@mail.gmail.com>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <e4ccab9ca26f73133a4b7c3394ff08f7e210d060.1445545973.git.yann.morin.1998@free.fr>
 <CAHXCMMLLM-CCZrAgQ-uPNVz1Ly=q5d61Psv6KMDeV795xZ8mqA@mail.gmail.com>
Message-ID: <20151023202515.GC3674@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-10-23 21:39 +0200, Samuel Martin spake thusly:
> On Thu, Oct 22, 2015 at 10:33 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > In the manual, add a note that packages can use $(FOO_PKGDIR) to get the
> > path to the directory containg the .mk and Config.in files, if they need
> > it to e.g. copy files from there, like startup scripts, systemd units or
> > any other resource.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > ---
> >  docs/manual/adding-packages-generic.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
> > index 9d6401f..17ada16 100644
> > --- a/docs/manual/adding-packages-generic.txt
> > +++ b/docs/manual/adding-packages-generic.txt
> > @@ -491,6 +491,9 @@ endef
> >
> >  In the action definitions, you can use the following variables:
> >
> > +* +$(FOO_PKGDIR)+ contains the path to the directory containing the
> > +  +foo.mk+ and +Config.in+ files.
> 
> No mention to what/when this new variable could be useful?
> e.g. refer to some packages files coming within the Buildroot tree
> such as runtime configuration files...

OK, I will add a bit of comment about the use of this variable.

Thanks! :-)

Regards,
Yann E. MORIN.

> >  * +$(@D)+, which contains the directory in which the package source
> >    code has been uncompressed.
> >
> > --
> > 1.9.1
> >
> 
> Regards,
> 
> -- 
> Samuel

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
