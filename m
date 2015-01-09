From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 Jan 2015 22:40:30 +0100
Subject: [Buildroot] [PATCH] Linux kernel module for Waveshare 3.2inch
 RPi LCD (B) V3 touch controller
In-Reply-To: <trinity-3729d3fe-9b4d-466b-b7ff-526c7b743a64-1420834880672@3capp-gmx-bs63>
References: <trinity-3729d3fe-9b4d-466b-b7ff-526c7b743a64-1420834880672@3capp-gmx-bs63>
Message-ID: <20150109214030.GA7236@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-01-09 21:21 +0100, Peter Seiderer spake thusly:
[--SNIP--]
> Maybe the way to go is to wait (or add?) for raspberry pi linux-3.18
> kernel support in buildroot with device tree overlay support (see [1],[2])?

I'm working on it, and should be able to submit it shortly. You can see
the previous attempt in that thread:
    http://lists.busybox.net/pipermail/buildroot/2015-January/116241.html

(Unfortunately, the archives for the ML does not sort the mails properly
as a thread.)

You can see the current state of my work by browsing the yem/rpi-dt
branch on my Buildroot tree:
    http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/rpi-dt

> > I don't know what the policy of Buildroot should be about accepting
> > crap, but on my side, I will not add such a package to Buildroot.
> Anyone with pro/con opinion?

I concur with Thomas.

[--SNIP--]
> My decision for raspberry pi was because of support for (hopefully)
> good audio out (using the hifiberry dac, but not yet delivered)...

And the overlays for those devices I take care in my patchset. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
