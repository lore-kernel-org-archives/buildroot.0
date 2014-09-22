From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 22 Sep 2014 23:05:11 +0200
Subject: [Buildroot] [PATCH 07/23 v5] docs/manual: simplify generation
	dependencies
In-Reply-To: <CAAXf6LU8zTz-YNgBZfpNUwHkjWLPawgxAM655kvxkEX9_Vq5FQ@mail.gmail.com>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <7dc3e2f0cf37f042723a473e1de04e5e432f7c75.1410692670.git.yann.morin.1998@free.fr>
 <CAAXf6LU8zTz-YNgBZfpNUwHkjWLPawgxAM655kvxkEX9_Vq5FQ@mail.gmail.com>
Message-ID: <20140922210511.GD4358@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-09-19 22:18 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > The document's main file is already part of MANUAL_SOURCES, so no need
> > to explicitly depend on it.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Samuel Martin <s.martin49@gmail.com>
> > Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> 
> Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Just a side note: I've been wondering if we should change the
> extension of the manual source files from .txt to .asciidoc. This
> seems to be the default extension and will make sure that vim selects
> the right syntax highlighting by default. I guess other editors would
> do the same (not tested).
> What do you think of that? Or is it unnecessary?
> On Debian, vim does not parse the modeline by default for security
> reasons, so the first two lines in each of these .txt files do not
> help there.

Well, my vim surely does. OK, it's Ubuntu, not Debian. Still...
I tried with an empty ~/.vim: I still get asciidoc syntax highlighting.

.asciidoc is overkill, I think. I'm not against, but may we wait for
after the series is applied? Trying not to get too much on my plate...
Hehe! ;-)

> Best regards,
> Thomas

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
