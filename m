From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Oct 2014 19:16:05 +0200
Subject: [Buildroot] [PATCH v3] rpi-userland: bump revision for musl
 compile fixes
In-Reply-To: <1739784.babPHSSYPS@hyperion>
References: <1410541269-32529-1-git-send-email-maarten@treewalker.org>
 <1491715.MQnf8L3yFy@hyperion> <20141018130248.GB31723@free.fr>
 <1739784.babPHSSYPS@hyperion>
Message-ID: <20141018171605.GC31723@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maarten, All,

On 2014-10-18 18:46 +0200, Maarten ter Huurne spake thusly:
> On Saturday 18 October 2014 15:02:48 Yann E. MORIN wrote:
> > Well, I do not want to have weston break. weston is, as far as I can
> > see, the only package in Buildroot that can make use of rpi-userland.
> > Breaking it is out of the equation.
> 
> rpi-userland provides GL ES (BR2_PACKAGE_HAS_LIBGLES) among other features, 
> so there are several more packages that depend on it.

Right, I forgot about that...

[--SNIP--[
> I have a git clone of rpi-userland set up already to be able to submit the 
> patches upstream, so creating a combined patch is not much work. I'll do 
> that.

So, I take it you have a fix for this issue?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
