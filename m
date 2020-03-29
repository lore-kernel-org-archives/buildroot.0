From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Mar 2020 18:52:50 +0200
Subject: [Buildroot] [PATCH] {linux, linux-headers}: add version 5.5
In-Reply-To: <CAJiuCcdt69zFd6pQkTbJCfyWaYCpDC41ShN=Q71ZMKZdTuY9xQ@mail.gmail.com>
References: <20200210162102.27584-1-jagan@amarulasolutions.com>
 <87mu9ohhlg.fsf@dell.be.48ers.dk>
 <CAJiuCceSh-hkUZ+6O1RkGGUKOfMy_T2Dx=7nt+6o3JxGL2390A@mail.gmail.com>
 <20200329140534.GC22325@scaer>
 <CAJiuCcdt69zFd6pQkTbJCfyWaYCpDC41ShN=Q71ZMKZdTuY9xQ@mail.gmail.com>
Message-ID: <20200329165250.GI22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cl?ment, All,

On 2020-03-29 17:34 +0200, Cl?ment P?ron spake thusly:
> On Sun, 29 Mar 2020 at 16:05, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2020-03-29 12:34 +0200, Cl?ment P?ron spake thusly:
> > > On Tue, 11 Feb 2020 at 23:41, Peter Korsgaard <peter@korsgaard.com> wrote:
> > > > Given that 5.5 is not a LTS kernel, I would prefer to hold back on this
> > > > patch until I release 2020.02-rc1 and create a next branch.
> > > The 2020.02 has been release and I'm interested to build against 5.5.
> > > Is this patch acceptable?
> > 2020.02 is a stable release (and even an LTS). Backports into such a
> > branch is limited to build fixes, and security fixes. No new feature is
> > backported there.
> Sorry I didn't mean backported to 2020.02, but merged into master or next.

Ah, sorry, I misread you.

Well, nothing prevents it from being merged, except for the roughly 500
other pending patches:
    https://patchwork.ozlabs.org/project/buildroot/list/

I'll look into it now.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
