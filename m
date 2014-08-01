From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Aug 2014 22:21:41 +0200
Subject: [Buildroot] [PATCH 3 of 6 v2] uclibc: convert to
 kconfig-package infrastructure
In-Reply-To: <CAAXf6LXy=aUaO23sXiwpBybggjLdiLf4gFeZcVsiQZHMOR8CnA@mail.gmail.com>
References: <patchbomb.1406750281@localhost>
 <083076145a2b191e2b6a.1406750284@localhost>
 <20140731210717.GL3960@free.fr>
 <CAAXf6LXy=aUaO23sXiwpBybggjLdiLf4gFeZcVsiQZHMOR8CnA@mail.gmail.com>
Message-ID: <20140801202141.GA3778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-01 21:42 +0200, Thomas De Schampheleire spake thusly:
> On Thu, Jul 31, 2014 at 11:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2014-07-30 21:58 +0200, Thomas De Schampheleire spake thusly:
> >> This patch converts the uclibc package to the new kconfig-package
> >> infrastructure, thus removing code duplication and ensuring a consistent
> >> behavior of kconfig packages.
> >>
> >> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> >
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > However, I'd suggest a small enhancement (for a future patch):
> >     UCLIBC_KCONFIG_EDITORS = menuconfig nconfig
> 
> Unless I'm missing something, this is not possible without patching
> uclibc, because their makefiles do not define any other config editor
> than menuconfig...

Indeed. I was looking at their master, which has nconfig. But it is
missing in any of the releases so far.

When (if?) there is a new release, it can be added conditionally to that
version. One day. Maybe... ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
