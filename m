From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Mar 2014 18:38:31 +0100
Subject: [Buildroot] [PATCH v8] xbmc: new package
In-Reply-To: <CAGduivyzGsZjmrU0DD81kAEEEbc=r7Mhsm7yXLkL8xC=RkPP7g@mail.gmail.com>
References: <1393158585-27193-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140319235700.GC3328@free.fr>
 <CAGduivyzGsZjmrU0DD81kAEEEbc=r7Mhsm7yXLkL8xC=RkPP7g@mail.gmail.com>
Message-ID: <20140320173831.GA23560@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-03-20 09:25 +0100, Maxime Hadjinlian spake thusly:
> On Thu, Mar 20, 2014 at 12:57 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2014-02-23 13:29 +0100, Maxime Hadjinlian spake thusly:
> >> XBMC is an award-winning free and open source (GPL) software media player and
> >> entertainment hub for digital media.
> >
> > Are you still working on this?
> Yup, I am truly sorry with the lack of communication. I have been
> under an ocean of work and as such have really no energy left to hack
> (and my wife would literally murder me at this point).

Hey, no problem. We all have real lives to deal with. ;-)

> *BUT* I was thinking of working on this either during my lunch hour or
> friday night since I have the whole evening to myself.

Do not feel like this should be a burden on your shoulders. Take it
along when you can and want. Doing something because you feel you have
to is the best way to get burnt.

> > If that can help you, I've started accumulating a few of the suggested
> > changes in a branch in my tree:
> >     git://gitorious.org/buildroot/buildroot.git yem/xbmc
[--SNIP--]
> From my point of view, I have left to do :
>     - The removal of the patch regarding the RPi specific settings
>     - Add them thought and advancedsettings.xml which will be
> installed with XBMC if we are building for an RPi.
> 
> Have I missed anything ?

No, this is basically the review you had so far.

I can see improvements, but that can easily go in followup patches.

> Again sorry for the lack of communication and sudden disappearance.

No problem! Just ensure you enjoy doing that, and not feel compelled to.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
