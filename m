From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 2 Oct 2016 21:44:30 +0200
Subject: [Buildroot] [PATCH 2/2] package/snappy: bump version
In-Reply-To: <87eg3ypmy6.fsf@dell.be.48ers.dk>
References: <1475348688-1805-1-git-send-email-yann.morin.1998@free.fr>
 <1475348688-1805-2-git-send-email-yann.morin.1998@free.fr>
 <87eg3ypmy6.fsf@dell.be.48ers.dk>
Message-ID: <20161002194430.GA4066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2016-10-02 21:31 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> For these bump-to-another-git-revision changes I would prefer some
> context / details. For bumps to a new release we at least know that the
> maintainer thinks the sw is ready to be used. With random git versions
> not so much.
> 
> E.G. has some important bugfix or new feature been added? Have you used
> it yourself? Is the new hash the latest commit in the repo or something
> else? ..

Here's your commit log:

There's been a single release of snappy since the move from GoogleCode
to Github; that release was more than a year ago. In that time frame,
only 14 commits went in master, of which to merges, so about 1 real
commit per month...

For a brief summary of additional stuff since the last release:
  - provide snappy.pc
  - a few generic bug fixes, as well as a few ARM-specific ones
  - a few buildsystem fixes

Since we can't say releases are made on a timely cadence, let's just hop
to the latest master from the git tree.

;-)

> Anyway - Committed, thanks.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
