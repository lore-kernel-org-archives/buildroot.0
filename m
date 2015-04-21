From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Apr 2015 00:02:10 +0200
Subject: [Buildroot] [PATCH] rtai: remove option
 BR2_LINUX_KERNEL_EXT_RTAI_PATCH
In-Reply-To: <5536C826.8080904@mind.be>
References: <1429652188-11586-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5536C4ED.3010008@mind.be>
 <20150421234737.03dbb086@free-electrons.com>
 <5536C826.8080904@mind.be>
Message-ID: <20150421220210.GD4262@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-21 23:59 +0200, Arnout Vandecappelle spake thusly:
> On 21/04/15 23:47, Thomas Petazzoni wrote:
> > Arnout,
> > 
> > On Tue, 21 Apr 2015 23:45:17 +0200, Arnout Vandecappelle wrote:
> > 
> >>  This requires legacy handling. With in the help text something like
> >>
> >> 	  The BR2_LINUX_KERNEL_EXT_RTAI_PATCH option never worked, so it is
> >> 	  probably not useful. If you do have a valid use case and it used to
> >> 	  work for you, please let us know on buildroot at buildroot.net.
> > 
> > Well, I talked about Config.in.legacy handling in the commit message:
> 
>  TL;DR :-)
> 
> > 
> > """
> > Bottom line is that this feature has never worked, so there is not
> > even a point in adding Config.in.legacy support for it.
> > """
> > 
> > Should I understand that you don't agree with this reasoning, and still
> > want Config.in.legacy handling?
> 
>  Yep, because if someone _does_ have it set, it probably works for them and we
> should know about it. If nobody has it set, then it doesn't hurt to have it in
> legacy.

But there is absolutely *no way* this can work *at all*, as demonstrated by
Thomas.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
