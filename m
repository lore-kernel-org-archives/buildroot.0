From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 20 Jan 2013 15:59:44 +0100
Subject: [Buildroot] [PATCH 1/6] pkg-infra: log current message
In-Reply-To: <20130120153821.6fc6853c@skate>
References: <cover.1358379198.git.yann.morin.1998@free.fr>
 <50FBF5EA.5010303@mind.be> <20130120153821.6fc6853c@skate>
Message-ID: <201301201559.44958.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Arnout, All,

On Sunday 20 January 2013 Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Sun, 20 Jan 2013 14:49:30 +0100, Arnout Vandecappelle wrote:
> 
> >   I'm a bit concerned because this is another blocker for top-level 
> > parallel build (the contents of last-action will be incorrect).
> 
> I agree that top-level parallel build would be nice, but I'm wondering
> whether it is realistic to think we will support it one day.
[--SNIP--]
> Do we want to implement this per-package sysroot thing?

My stance on the subject is: no.

Although top-level // builds would be nice, as it would have the potential
to greatly speed up builds (expecially with many packages enabled), this
would complexifies Buildroot to a point where things will be much harder
to follow, understand, debug and fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
