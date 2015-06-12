From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 12 Jun 2015 19:47:47 +0200
Subject: [Buildroot] [PATCH 0/11 v2] pkg-kernel-module: new infra to
 ease building kernel modules (branch yem/kernel-modules)
In-Reply-To: <557A174A.6040806@mind.be>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <20150611180338.GA3689@free.fr> <557A174A.6040806@mind.be>
Message-ID: <20150612174747.GB3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-06-12 01:18 +0200, Arnout Vandecappelle spake thusly:
> On 06/11/15 20:03, Yann E. MORIN wrote:
> > Hello All,
> > 
> > On 2015-06-10 21:22 +0200, Yann E. MORIN spake thusly:
> >> This series introduces a new infrastructure to help writing packages
> >> that build kernel modules.
> > 
> > I'll mark this series as "Changes Requested" in patchwork, because I took
> > Jeremy's comment into account, and because I was able to improve it yet a
> > bit more and convert one more kernel-module-providing package (namely,
> > nvidia-driver; who would have thought it would be possible? ;-) ).
> 
>  Early feedback on that one:
> 
> NVIDIA_DRIVER_HEADERS_H -> NVIDIA_DRIVER_MODULE_BUILD_HEADERS

OK.

> Commit message should explain why the custom install isn't needed anymore either.

OK.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
