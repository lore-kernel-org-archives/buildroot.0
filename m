From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 20 Mar 2013 23:04:15 +0100
Subject: [Buildroot] [git commit] package/connman: bump version to 1.11
In-Reply-To: <20130320222341.5e947d69@skate>
References: <20130301101142.D5D809ADCE@busybox.osuosl.org>
 <20130320222341.5e947d69@skate>
Message-ID: <201303202304.15607.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Wednesday 20 March 2013 Thomas Petazzoni wrote:
> On Fri, 22 Feb 2013 23:46:32 +0100, Peter Korsgaard wrote:
> 
> > -CONNMAN_VERSION = 1.10
> > +CONNMAN_VERSION = 1.11
> 
> Seems like Connman 1.11 is not happy with some IPv6 issues:
> http://autobuild.buildroot.org/results/f99ae7af46c70f7c356b7771321511a42eb3694d/build-end.log.
> 
> Interestingly, the toolchain used here has IPv6 support. The toolchain
> is an internal toolchain, using 3.8 kernel headers, so pretty recent.
> 
> Ideas?

I'm looking into it. connman builds and works OK here, with IPv6 in an
external eglibc-based toolchain. I'm using 3.6 headers, though.

I'm now trying to reproduce this issue.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
