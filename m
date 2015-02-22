From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Feb 2015 22:26:07 +0100
Subject: [Buildroot] [PATCH v7] wine: New package
In-Reply-To: <54EA42C0.9010608@dawncrow.de>
References: <54E63769.1050208@dawncrow.de> <20150222204207.GG4016@free.fr>
 <54EA42C0.9010608@dawncrow.de>
Message-ID: <20150222212607.GI4016@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andre, All,

On 2015-02-22 21:57 +0100, Andr? Hentschel spake thusly:
> Am 22.02.2015 um 21:42 schrieb Yann E. MORIN:
> > On 2015-02-19 20:20 +0100, Andr? Hentschel spake thusly:
> >> Adds new package: wine

Another thing I noticed during the build of host-wine:

    configure: WARNING: prelink not found, base address of core dlls won't
    be set correctly.

I am not sure if that will be a problem.

My system lacks prelink installed. Does yours have it?
  - if not, I guess you get a working Wine, even without prelink, right?
  - if you do, can you check that Wine still works fine without it?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
