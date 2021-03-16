From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 16 Mar 2021 22:05:02 +0100
Subject: [Buildroot] [PATCH v1 3/3] package/batman-adv: add note about
 linux mainline kernel module alternative
In-Reply-To: <20210316215314.4d71f86c@gmx.net>
References: <20210316181429.30804-1-ps.report@gmx.net>
 <20210316181429.30804-3-ps.report@gmx.net>
 <20210316201923.GC3443324@scaer> <20210316215314.4d71f86c@gmx.net>
Message-ID: <20210316210502.GE3443324@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-16 21:53 +0100, Peter Seiderer spake thusly:
> On Tue, 16 Mar 2021 21:19:23 +0100, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Peter, All,
> > On 2021-03-16 19:14 +0100, Peter Seiderer spake thusly:
> > > Since version 2.6.38 batman-adv is integreated into the linux mainline
> > > kernel ([1], [2]) so add a note about it in the Config.in help text.
> > Note also that the versionwe have is 2019.3, two years old, and the
> > in-tree version for recent kernels is probably in better shape than what
> > we carry.
> See
> 	https://patchwork.ozlabs.org/project/buildroot/patch/20210311210804.9616-2-ps.report at gmx.net/
> for update to 2021.0

Hehe... :-)

> > Shouldn't we drop this package, now?
> 
> Would suspect the use case/reason why batman-adv is still provided as out-of-tree module is
> to enable up-to-date batman with older kernels...as the 2021.0 release announcement mentions
> compatibility with 4.4 to 5.11 (see [3])...

OK, that make sense. Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
