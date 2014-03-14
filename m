From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 Mar 2014 00:03:02 +0100
Subject: [Buildroot] [PATCH v2] pyrex: new host package
In-Reply-To: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
References: <1394837899-14937-1-git-send-email-rc.lsw.collaborate@gmail.com>
Message-ID: <20140314230302.GD16649@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-03-14 17:58 -0500, rc.lsw.collaborate at gmail.com spake thusly:
> From: mlweber <mlweber@localhost>
> 
> This patch is a revision of the v1, found here:
> http://patchwork.ozlabs.org/patch/276585/

Thanks, I've marked it as "Superseded". It's nice you provided the URL
of the previous patch, it made it easy-as-a-snap to find it. :-)

> For v2, I made a first attempt at making this a host only pkg. Feedback would
> be much appreciated since being a host only package a Config.in.host was
> used and I still included it in the normal Python submenu as that seemed to
> be the clearest location.  Also in the naming of the menu entry I provided
> a "(host tool)" for clarification.

I think we would prefer that all host-only tools be located in the "Host
utilities" menu, rather than spread around in the different menus.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
