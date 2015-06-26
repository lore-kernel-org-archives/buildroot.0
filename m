From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:35:47 +0200
Subject: [Buildroot] [PATCH v6 06/16] package/opencv: reduce modules on
 by default
In-Reply-To: <20150626153404.GC27480@free.fr>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-7-git-send-email-s.martin49@gmail.com>
 <20150626153404.GC27480@free.fr>
Message-ID: <20150626153547.GD27480@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-26 17:34 +0200, Yann E. MORIN spake thusly:
> On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> > Since its integration into Buildroot, OpenCV always enables all modules
> > by default because the inter-module denpedency were not supported.
> > 
> > Now that OpenCV inter-module dependencies are correctly set at the
> > Buildroot configuration level, it is possible to reduce the enabled
> > module list to its minimal set, letting kconfig enable the other
> > modules.
> > 
> > This change will not change anything WRT a defconfig build with opencv.
> > 
> > Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> Although I'm usually not opposed to getting the smallest possible config
> as a default, as you say this one breaks existing defconfigs.
> 
> OTOH, do we really care?
> 
> Anyway, I won't ack this one, but I am not ooposed to it being merged
> either.

This should have been a comment to the following patch:
    package/opencv: disable all modules by default

Sorry for the confusion...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
