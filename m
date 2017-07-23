From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jul 2017 15:41:50 +0200
Subject: [Buildroot] [PATCH 16/20] system: separate sysv and systemd
 parts of the skeleton
In-Reply-To: <f1c6b608-8ac9-f4c2-c59d-05f3d6d1b893@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <f797589346d85a6ebba86bb418d6b818051d0da7.1500398733.git.yann.morin.1998@free.fr>
 <430c46f8-bb5d-a2bf-3695-6822609e0a2c@mind.be>
 <20170723102453.GE26998@scaer>
 <da57b804-8b59-4c8b-b851-c90f61a8fefd@mind.be>
 <f1c6b608-8ac9-f4c2-c59d-05f3d6d1b893@mind.be>
Message-ID: <20170723134150.GH26998@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-23 15:39 +0200, Arnout Vandecappelle spake thusly:
> On 23-07-17 15:32, Arnout Vandecappelle wrote:
> > On 23-07-17 12:24, Yann E. MORIN wrote:
> >> Arnout, All,
> >>
> >> On 2017-07-23 02:08 +0200, Arnout Vandecappelle spake thusly:
> > 
> > [snip]
> >>> But the commit log should at least explain this.
> >>
> >> Like so, maybe?
> >>
> >>     For systemd, we only ever need an entry for /, because all the rest
> >>     is totally irrelevant for systemd (it automatically mounts what it
> >>     needs where it needs it).
> > 
> >  But... skeleton-common installs a lot more than just /, no? It installs
> > /etc/stuff, and a bunch of top-level directories...
> 
>  Sorry, I missed that this was about fstab, I thought it was about the skeleton
> itself.
> 
>  fstab is not yet mentioned at all in the commit message, so this should be
> rephrased a little. But content-wise this is indeed what I wanted.

Ok, good. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
