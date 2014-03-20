From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 20 Mar 2014 09:25:03 +0100
Subject: [Buildroot] [PATCH v8] xbmc: new package
In-Reply-To: <20140319235700.GC3328@free.fr>
References: <1393158585-27193-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140319235700.GC3328@free.fr>
Message-ID: <CAGduivyzGsZjmrU0DD81kAEEEbc=r7Mhsm7yXLkL8xC=RkPP7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all
On Thu, Mar 20, 2014 at 12:57 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Maxime, All,
>
> On 2014-02-23 13:29 +0100, Maxime Hadjinlian spake thusly:
>> XBMC is an award-winning free and open source (GPL) software media player and
>> entertainment hub for digital media.
>
> Are you still working on this?
Yup, I am truly sorry with the lack of communication. I have been
under an ocean of work and as such have really no energy left to hack
(and my wife would literally murder me at this point).
*BUT* I was thinking of working on this either during my lunch hour or
friday night since I have the whole evening to myself.
>
> If that can help you, I've started accumulating a few of the suggested
> changes in a branch in my tree:
>     git://gitorious.org/buildroot/buildroot.git yem/xbmc
>
>     091d9b6 xbmc: new package
>     6547d40 package/xbmc: background XBMC and store PID in startup script
>     296d6b8 package/xbmc: cleanup dependencies
>
> I've made separate patches so we can keep track of the changes on top of
> your initial patch, but they should of course all be eventually folded in
> a single patch before final submission (or you can do it now in your tree
> if you want; just keep the SoB tags, please.)
Oh shiny ! I'll have a look at them and merge them. I had already
cleanup the dependency but I'll look at your patch to check if I
didn't forgot anything.

From my point of view, I have left to do :
    - The removal of the patch regarding the RPi specific settings
    - Add them thought and advancedsettings.xml which will be
installed with XBMC if we are building for an RPi.

Have I missed anything ?
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

Again sorry for the lack of communication and sudden disappearance.
