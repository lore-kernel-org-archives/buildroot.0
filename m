From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 9 Jul 2013 20:54:22 +0200
Subject: [Buildroot] [PATCH] system: add option to pass extra args to
 post-build and post-image scripts
In-Reply-To: <20130709182536.GU5098@tarshish>
References: <1373393196-19024-1-git-send-email-yann.morin.1998@free.fr>
 <20130709182536.GU5098@tarshish>
Message-ID: <20130709185422.GC3543@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, All,

On 2013-07-09 21:25 +0300, Baruch Siach spake thusly:
> Hi Yann,
> 
> On Tue, Jul 09, 2013 at 08:06:36PM +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > It can be useful to have different configuration use the same post-build
> > and/or post-image scripts as they share a common infrastructure, but yet
> > have minor differentiation.
> > 
> > This option allows passing zero or more additional arguments to each
> > post-build or post-image script.
> > 
> > The same set of extra arguments are passed to all scripts, it is not
> > possible to pass different arguments to each script.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> You should also change the "first and only argument" language in the help text 
> of BR2_ROOTFS_POST_BUILD_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT.

And update the manual while at it, indeed!
Thanks for pointing this. :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
