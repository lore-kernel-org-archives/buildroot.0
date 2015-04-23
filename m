From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Apr 2015 23:27:15 +0200
Subject: [Buildroot] [PATCH 0/30] matchbox: huge cleanups (branch
 yem/matchbox)
In-Reply-To: <55396322.3040604@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <55396322.3040604@mind.be>
Message-ID: <20150423212715.GD4255@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-23 23:24 +0200, Arnout Vandecappelle spake thusly:
> On 04/22/15 20:09, Yann E. MORIN wrote:
[--SNIP--]
> > The series is split into multiple parts;
> > 
> >   - patches 1-9 make all packages real packages, i.e. with proper
> >     Kconfig options. No functionality change.
> 
>  One overall remark to this part of the series: I'd move them directly under
> package/ which is supposed to be the standard way of doing things now, so get
> rid of the matchbox subdirectory. That's also the way it works with Kodi BTW.

Right, I can do that (though that will be a hell of a rebase!).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
