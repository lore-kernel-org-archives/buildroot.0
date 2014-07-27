From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jul 2014 14:49:00 +0200
Subject: [Buildroot] [PATCH 1/2] docs/manual: enhance doc for
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y
In-Reply-To: <20140727143418.727a55e3@free-electrons.com>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
 <f8aa686b6618867afc2725a276beb75a63e8ca12.1406323367.git.yann.morin.1998@free.fr>
 <20140727143418.727a55e3@free-electrons.com>
Message-ID: <20140727124900.GA3895@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-27 14:34 +0200, Thomas Petazzoni spake thusly:
> On Fri, 25 Jul 2014 23:28:14 +0200, Yann E. MORIN wrote:
> > The BR2_TOOLCHAIN_HEADERS_AT_LEAST_X_Y symbols can be used to denote the
> > lowest required kernel headers version, but also the highest supported
> > version. Document that.
> 
> I'm honestly really unsure about this. Kernel headers expose the kernel
> to userspace API, and this API is supposed to be backward compatible.
> Therefore, I don't see why we should document the idea of expressing on
> dependency on a highest kernel header version.
> 
> The v4l2 example we had on freescale seems like an API that shouldn't
> have been part of the kernel to userspace API, and therefore shouldn't
> be used by userspace libraries/applications.
> 
> Therefore, I'm tempted to say no to this patch, but I'm interested to
> be convince otherwise :)

Well, APIs can get deprecated over time, and eventually removed. For
example, the status of interfaces is described in Documentation/ABI in
your favourite kernel source tree.

So, yes, I still think this patch is valid.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
