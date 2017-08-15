From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 15 Aug 2017 18:30:00 +0200
Subject: [Buildroot] [PATCH] package/fakeroot: fix highly parallel uses
In-Reply-To: <9e6f4ee1-28a0-9a29-e5fd-26b398cc9406@mind.be>
References: <20170813214834.24093-1-yann.morin.1998@free.fr>
 <c3a46dd3-57f1-6b84-dc93-23a4da8de50c@mind.be>
 <9e6f4ee1-28a0-9a29-e5fd-26b398cc9406@mind.be>
Message-ID: <20170815163000.GB3427@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All

On 2017-08-15 18:24 +0200, Arnout Vandecappelle spake thusly:
> On 15-08-17 18:18, Arnout Vandecappelle wrote:
> > 
> > On 13-08-17 23:48, Yann E. MORIN wrote:
> >> Although the issue can very well occur with low-paralle builds, or even
> >> with non-parallel builds, the conditions are so strict that the ocasion
> >> it breaks is extremely rare, to the point where a failure would go
> >> unnoticed.
> >>
> >> Fixes #10141.
> >>
> >> Reported-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> >> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
> 
> >  As you noticed on IRC, applied to master, thanks.
> 
>  By the way, did you send the patch upstream in the end? I looked in
> bugs.debian.org but couldn't find anything...

I did not open a bug on b.d.o: as I see it, patches there can linger for
ages without action bein taken, so I don't really see the point... :-(

However, I did send the patch directly to the maintainer, yes, but have
had no feedback so far. But it has only be a day. If he insists so, I'll
open a bug on b.d.o, of course.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
