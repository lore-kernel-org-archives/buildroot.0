From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 31 Dec 2012 19:19:28 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-30
In-Reply-To: <20121231181224.4326dab6@skate>
References: <20121231073503.B128B52C08C@lolut.humanoidz.org>
 <201212311257.38291.yann.morin.1998@free.fr> <20121231181224.4326dab6@skate>
Message-ID: <201212311919.28794.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Monday 31 December 2012 Thomas Petazzoni wrote:
> On Mon, 31 Dec 2012 12:57:38 +0100, Yann E. MORIN wrote:
> 
> > I think we should do 2: packages in buildroot should at least all (except
> > maybe some platform-specific packages that may require an external
> > toolchain, eg. bfin and ?blaze) build with the internal toolchain
> > mechanism.
> > 
> > What do you think?
> 
> Another option: identify *why* wordexp is needed. I just had a quick
> look: only src/epggrab.c includes <wordexp.h>. It doesn't use wordexp()
> and wordfree() and apparently none of the definitions I have in my
> glibc wordexp.h.
> 
> Can you try to build with the #include <wordexp.h> removed?

OK, will do. Later, it's almost time for... Oh, got to go now! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
