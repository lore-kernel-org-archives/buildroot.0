From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Nov 2017 21:50:48 +0100
Subject: [Buildroot] [PATCH] package/directfb: fixes detection of tslib
 version during configure
In-Reply-To: <1511110605-18646-1-git-send-email-julien.boibessot@free.fr>
References: <1511110605-18646-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20171122215048.6a54cf98@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Nov 2017 17:56:45 +0100, julien.boibessot at free.fr wrote:
> From: Julien BOIBESSOT <julien.boibessot@armadeus.com>
> 
> Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>

What problem is this fixing? Is there an autobuilder failure related to
this? If not, could you include a failing defconfig in the commit log,
as well as the relevant part of the build log showing the failure?

A small explanation would also be nice. Why is DirectFB checking for
tslib-1.0 if it's named tslib? Mistake? Different version of tslib?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
