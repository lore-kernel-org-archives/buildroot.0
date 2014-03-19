From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Mar 2014 00:57:00 +0100
Subject: [Buildroot] [PATCH v8] xbmc: new package
In-Reply-To: <1393158585-27193-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1393158585-27193-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20140319235700.GC3328@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-02-23 13:29 +0100, Maxime Hadjinlian spake thusly:
> XBMC is an award-winning free and open source (GPL) software media player and
> entertainment hub for digital media.

Are you still working on this?

If that can help you, I've started accumulating a few of the suggested
changes in a branch in my tree:
    git://gitorious.org/buildroot/buildroot.git yem/xbmc

    091d9b6 xbmc: new package
    6547d40 package/xbmc: background XBMC and store PID in startup script
    296d6b8 package/xbmc: cleanup dependencies

I've made separate patches so we can keep track of the changes on top of
your initial patch, but they should of course all be eventually folded in
a single patch before final submission (or you can do it now in your tree
if you want; just keep the SoB tags, please.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
