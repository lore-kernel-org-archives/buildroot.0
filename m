From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 22 Dec 2015 17:59:44 +0100
Subject: [Buildroot] [PATCH 0/2] Fixing xdriver_xf86-video-ati building
In-Reply-To: <eh5okcx2hb.ln2@ID-313208.user.individual.net>
References: <1450790990-28939-1-git-send-email-ltrimas@synopsys.com>
 <eh5okcx2hb.ln2@ID-313208.user.individual.net>
Message-ID: <20151222165944.GB21998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-12-22 16:06 +0100, Bernd Kuhls spake thusly:
> Am Tue, 22 Dec 2015 16:29:48 +0300 schrieb Lada Trimasova:
> > xdriver_xf86-video-ati depends on the radeon driver from libdrm and DRI
> > support in xserver_xorg-server, to achieve this we select the Radeon
> > mesa3d DRI driver which needs to be enabled for all architectures.
> please have a look at my patch and join the discussion about whether this 
> driver can be used outside the Intel world or not ;)
> 
> http://patchwork.ozlabs.org/patch/523146/

Well, IIUC, Radeon is the chip in AMD's portfolio, right?

So, you culd get that board:
    http://softiron.co.uk/
and plugin any PCI-E garphic card to get an Radeon GPU on AArch64.

So, no Radeon is not restricted to x86.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
