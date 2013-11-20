From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Nov 2013 23:03:10 +0100
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
In-Reply-To: <5281E28A.5080503@mind.be>
References: <20131111215435.GC3510@free.fr> <52817846.2080301@ozlabs.org>
 <20131112075831.5d00efd8@skate> <5281E28A.5080503@mind.be>
Message-ID: <20131120220310.GA3484@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-11-12 09:10 +0100, Arnout Vandecappelle spake thusly:
>  I think the ART flags in the patch list should never be used blindly
> anyway. Instead, it's an indicator of which patches are interesting to look
> at in more detail. Right?

That's the way I would use it, yes:
  - as a maintainer, I'd first look at patches with ART flags to apply
    them;
  - as a contributor, I'd first look at patches without ART flags to
    review them.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
