From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 15 Nov 2018 17:49:56 +0100
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: Fix show-build-order
In-Reply-To: <20181115163520.GJ10271@scaer>
References: <20181115152541.27596-1-serj.kalichev@gmail.com>
 <20181115163520.GJ10271@scaer>
Message-ID: <20181115164956.GK10271@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Serj, All,

On 2018-11-15 17:35 +0100, Yann E. MORIN spake thusly:
> On 2018-11-15 18:25 +0300, Serj Kalichev spake thusly:
> > The command "make show-build-order" doesn't show dependencies of rootfs-common target.
> > 
> > This patch adds $(ROOTFS_COMMON_DEPENDENCIES) to PACKAGES variable.
> > 
> > Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> (I would still have preferred they be added to the _DEPENDENCIES list,
> but others disagreed, so...)

I somehow got confused to see that patch pop up on the list, wen Thomas
said he had integrated it in his PPS series.

It turns out that the previous thread was started by Andreas:
    http://lists.busybox.net/pipermail/buildroot/2018-November/thread.html#235256

This patch by Serj confused me because the reason for that same change
is totally different (but as valid).

My Reviewed-by tag still stands, obviously.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
