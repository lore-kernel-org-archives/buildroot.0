From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Jun 2018 18:08:27 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
Message-ID: <20180605160827.GD2503@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-06-05 00:21 +0200, Arnout Vandecappelle spake thusly:
> On 01-06-18 15:30, Stefan Becker wrote:
> > host-mkpasswd was a fork from whois to provide a host version of
> > mkpasswd for the build. This has caused a maintenance headache.
> > 
> > Replace it with host-busybox which can provide "mkpasswd" functionality
> > from own source code. That causes less hassle for different build
> > platforms.
> 
>  Just to be clear: does everybody agree that it is a good idea to use
> weakly-random numbers as salt, rather than real random numbers like whois does?

Not really, no. That is definitely no good. I was not aware of how bad
the busybox salt generator was.. Sigh....

(note: I did see your previous reply, but did not get enough time to
properly reply so far; sorry.)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
