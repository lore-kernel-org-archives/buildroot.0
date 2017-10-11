From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 11 Oct 2017 16:10:41 +0200
Subject: [Buildroot] Discussion on per-package logging
In-Reply-To: <20171011151918.5c48d933@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
 <20171011130842.GA2659@scaer>
 <20171011151918.5c48d933@windsurf.lan>
Message-ID: <20171011141041.GA2801@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-10-11 15:19 +0200, Thomas Petazzoni spake thusly:
> On Wed, 11 Oct 2017 15:08:42 +0200, Yann E. MORIN wrote:
> > In my opinion, we can't do and should not do anything about it.
> > 
> > Either the user wants a fast build, and then it is acceptable that the
> > output gets mangled, or he is trying to debug the build and thus is not
> > doing parallel build to start with.
> 
> I disagree with you, because there will obviously be cases where we
> want to debug a parallel build. A parallel build might uncover some
> specific issues, and we will want to have a look at the build log of a
> given package to understand what happened.
> 
> So I disagree on your assumption that either you're debugging or you're
> building in parallel.

Fair enough.

Yet, that does not change the outcome: we can't and shouldn't do much.
The user can specify -Orecursive (or maybe just -Otarget) in that case.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas Petazzoni
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
