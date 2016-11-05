From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Nov 2016 10:26:38 +0100
Subject: [Buildroot] warp7_defconfig build error
In-Reply-To: <CAOMZO5DsdPO=S1zqEpLyaiDuexxMFKNiLnw0AHdhxauOVhvisw@mail.gmail.com>
References: <CAOMZO5CjVc=qA2u95KydQrLkkjTUZUdB8t+v_QdX-NViRJs4LQ@mail.gmail.com>
 <CAOMZO5AjUAJqMuny_xn3OHEhdvtiZwkAQB-zJcZDvFr+z=LVTA@mail.gmail.com>
 <20161104212727.GB3766@free.fr>
 <CAOMZO5DsdPO=S1zqEpLyaiDuexxMFKNiLnw0AHdhxauOVhvisw@mail.gmail.com>
Message-ID: <20161105092638.GA31560@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabio, All,

On 2016-11-04 21:50 -0200, Fabio Estevam spake thusly:
> On Fri, Nov 4, 2016 at 7:27 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > We've recently switched to using pseudo instead of fakeroot (in an
> > attempt to solve #9286). But this is causing more problems.
> >
> > We're investigating a solution, but it's not trivial.
> >
> > In the meantime, you can try reverting ade91bc and 3cd88f1 (which we may
> > end up doing if we can't find a solution quickly).
> 
> Are these commit IDs correct? They don't seem to exist in my tree:

Damn. They are the commits I have locally that do the revert! :-)

The commits you want to revert are:
    325cff3 package/fakeroot: remove
    8035ceb fs: use pseudo instead of fakeroot

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
