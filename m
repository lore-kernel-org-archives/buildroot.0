From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 Feb 2014 22:11:10 +0100
Subject: [Buildroot] [PATCH 03/10] package/linux-headers: select
 appropriate 'AT_LEAST_XXX' header version
In-Reply-To: <0eda8f70-07a4-420f-a2ef-f00c121c5425@email.android.com>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
 <94dd7d99bafacf64d4b2497b01de76472f4c9a70.1392571021.git.yann.morin.1998@free.fr>
 <53029015.9020101@mind.be> <20140220181647.GA8457@free.fr>
 <20140220211752.1d988d1c@skate>
 <0eda8f70-07a4-420f-a2ef-f00c121c5425@email.android.com>
Message-ID: <20140220211110.GB8457@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On 2014-02-20 22:06 +0100, Thomas De Schampheleire spake thusly:
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> schreef:
> >Dear Yann E. MORIN,
> >
> >On Thu, 20 Feb 2014 19:16:47 +0100, Yann E. MORIN wrote:
> >
> >>     config BR2_KERNEL_HEADERS_SNAP
> >>         bool "Local Linux snapshot (linux-2.6.tar.bz2)"
> >
> >Don't worry about BR2_KERNEL_HEADERS_SNAP. It should be removed
> >entirely. It is completely weird to ask the tarball to be named exactly
> >linux-2.6.tar.bz2. IMO, we should simply get rid of this feature.
> 
> Let's do it at once!

I already have a patch for it in my local tree! ;-)

You can count on me when it comes to removing stuff! :-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
