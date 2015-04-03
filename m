From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Apr 2015 14:38:04 +0200
Subject: [Buildroot] [PATCH] toolchains: remove non-LFS toolchain
In-Reply-To: <20150403142647.11bbc9bd@free-electrons.com>
References: <1428057549-24019-1-git-send-email-yann.morin.1998@free.fr>
 <20150403142647.11bbc9bd@free-electrons.com>
Message-ID: <20150403123804.GB4348@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-03 14:26 +0200, Thomas Petazzoni spake thusly:
> On Fri,  3 Apr 2015 12:39:09 +0200, Yann E. MORIN wrote:
> > Buildroot now requires toolchains to have LFS; it's no longer optional.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  web/toolchains/configs/br-powerpc-603e-basic-cpp.config | 9 ---------
> >  1 file changed, 9 deletions(-)
> >  delete mode 100644 web/toolchains/configs/br-powerpc-603e-basic-cpp.config
> 
> Thanks, applied. However, you forgot to also update the CSV file that
> lists all toolchain (so I did that).

Damn, thanks.

> And next time if you could
> --subject-prefix="buildroot-test" or something like that, it would be
> great, as it allows to more clearly distinguish such patches from real
> Buildroot patches.

Well, here's what I did:
    git send-email HEAD^ --to buildroot --suffix='autobuild'

hoping to get something like [PATCH 1/1 autobuild] blabla

But looking at the docs, it's not a send-email option, it's a
format-patch option. Still it did auto-compete it. Damn... Sorry.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
