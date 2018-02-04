From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Feb 2018 15:46:27 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run
 as non-root
In-Reply-To: <20180204100444.GB2411@scaer>
References: <20180106152833.10111-1-yann.morin.1998@free.fr>
 <87bmh521a5.fsf@dell.be.48ers.dk> <20180204100444.GB2411@scaer>
Message-ID: <20180204144627.GC2411@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-02-04 11:04 +0100, Yann E. MORIN spake thusly:
> On 2018-02-03 22:47 +0100, Peter Korsgaard spake thusly:
> > I don't know much about Docker, but I was of the understanding that each
> > run statement creates a new layer and the number of layers should be
> > minimized, which is why you normally see stuff like:
[--SNIP--]
> It's always time for a docker expert to send a fixup patch, eh! ;-)
> Or I can have a look if I again get bored not to be in BRU... ;-]

There, I *really* got bored not being at FOSDEM...

    https://patchwork.ozlabs.org/project/buildroot/list/?series=26863

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
