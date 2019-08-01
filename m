From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Aug 2019 09:29:10 +0200
Subject: [Buildroot] [RFC PATCH v4 2/2] iputils: add capability for
 clockdiff, ping, traceroute6
In-Reply-To: <20190731222400.GB5083@x230>
References: <20190730213846.7488-1-petr.vorel@gmail.com>
 <20190730213846.7488-2-petr.vorel@gmail.com>
 <20190731160059.GJ3194@scaer>
 <20190801001310.644e3dc0@windsurf.home>
 <20190731222400.GB5083@x230>
Message-ID: <20190801072910.GA3548@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Petr, All,

On 2019-08-01 00:24 +0200, Petr Vorel spake thusly:
> > On Wed, 31 Jul 2019 18:00:59 +0200
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > Yes, but I believe it's the best solution for now, let's keep a
> > conditional like you're showing here. Which of course makes the change
> > to makedevs no longer relevant.
> Sure :). So merge the original version [1], related only to iputils?

Not really, because your first iteration still kept the suid bit on the
orograms.

I'm intrigued why you could not use the ifeq(...) construct, though...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
