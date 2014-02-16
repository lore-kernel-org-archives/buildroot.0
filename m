From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 21:42:20 +0100
Subject: [Buildroot] [PATCH 02/10] manual: document minimal kernel
	headers dependency
In-Reply-To: <a26f6957-03a6-4d97-8b34-a6a2d0546d5f@email.android.com>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <1249b172ff1e3a651955941fe7da32d3644ad2ee.1392571021.git.yann.morin.1998@free.fr>
 <a26f6957-03a6-4d97-8b34-a6a2d0546d5f@email.android.com>
Message-ID: <20140216204220.GC3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-02-16 21:03 +0100, Thomas De Schampheleire spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> schreef:
> >From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >Cc: Samuel Martin <s.martin49@gmail.com>
> >Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> >Cc: Arnout Vandecappelle <arnout@mind.be>
> >Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> >---
> > docs/manual/adding-packages-directory.txt | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> >diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> >index 754a145..1917823 100644
> >--- a/docs/manual/adding-packages-directory.txt
> >+++ b/docs/manual/adding-packages-directory.txt
> >@@ -218,6 +218,12 @@ use in the comment.
> > ** Dependency symbol: +BR2_USE_MMU+
> > ** Comment string: no comment to be added
> > 
> >+* Kernel headers
> >+** Dependency synbol: +BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y+, (replace
> >+   +X_Y+ with the proper version, see +toolchain/toolchain-common.in+)
> >+** Comment string: `headers >= X.Y` (replace +X.Y+ with the
> >+   proper version)
> 
> Are these backticks?
> Is there a specific reason you use this instead of single or double quotes?

I just duplicated what wah done for C++, a few lines below.

Lookign at the other comments, it looks like C++ is the only one using
backticks, the others use the +blabla+ format.

Will fix bot before submitting again.

Thanks for the review!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
