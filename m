From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 21 Apr 2014 16:24:44 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-20
In-Reply-To: <20140421114949.59c65c31@skate>
References: <20140421063009.036D5100FF4@stock.ovh.net>
 <20140421114949.59c65c31@skate>
Message-ID: <20140421142444.GC3359@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-04-21 11:49 +0200, Thomas Petazzoni spake thusly:
> >        arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/2cb13a5bb92dabed219d49f49f0b9a2dfe65a0ca/
> 
> cairo-gl-private.h:287:5: error: unknown type name 'GLchar'
> 
> Could some OpenGL person look into this? Paul ? Yann ?

With only a cursory look and a bit of Google-fuu, it looks like we need
a full OpenGL provider in this case.

I'll look at it more in details, but probably not before this evening...

I was afraid my recent OpenGL virtual package as the reason for this
failure, but we already had such failures in the past. Pfew... :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
