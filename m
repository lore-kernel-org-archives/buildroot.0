From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 May 2018 17:33:09 +0200
Subject: [Buildroot] [PATCH 0/7 v5] support/download: make the git
 backend even more robust
In-Reply-To: <20180501212513.5b73d344@windsurf.home>
References: <cover.1525164241.git.yann.morin.1998@free.fr>
 <20180501212513.5b73d344@windsurf.home>
Message-ID: <20180502153309.GA2513@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-05-01 21:25 +0200, Thomas Petazzoni spake thusly:
> On Tue,  1 May 2018 10:44:11 +0200, Yann E. MORIN wrote:
> > Yann E. MORIN (7):
> >       download/git: add warning not to use our git cache
> >       download/git: run all git commands in the current directory
> >       download/git: quickly exit when the cset does not exist
> >       download/git: try to recover from utterly-broken repositories
> >       download/git: ensure we checkout to a clean state
> >       download/git: ensure we can checkout repos with submodule conversions
> >       download/git: always do full-clone
> Series applied, thanks! And thanks to Ricardo for all the testing and
> review!

Indeed, thanks a *lot* to Ricardo for the interesting reviews and the
extensive testing. Very much appreciated! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
