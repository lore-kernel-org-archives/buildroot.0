From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Jun 2013 00:05:58 +0200
Subject: [Buildroot] [pull request] Pull request for branch
 yem-patchwork-fixes
In-Reply-To: <20130603221112.GC3439@free.fr>
References: <cover.1369650924.git.yann.morin.1998@free.fr>
 <20130603221112.GC3439@free.fr>
Message-ID: <20130604220558.GA3206@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2013-06-04 00:11 +0200, Yann E. MORIN spake thusly:
> On 2013-05-27 12:36 +0200, Yann E. MORIN spake thusly:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Hello All!
> > 
> > Here are four patches from Nathan Lynch to fix building out-of-tree
> > when the Buildroot source tree is readonly (eg. shared via NFS between
> > multiple developers).
> 
> Ping? I'm trying to check bug #5780, but can't go that far, since
> target/ is readonly, which is fixed by one of these patches.

Well, forget this series, I've uncovered a remaining issue.
(Peter: I've marked it as "Changes Requested" in the Patchwork ;-) )

Sorry... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
