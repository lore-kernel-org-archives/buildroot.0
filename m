From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:56:01 +0200
Subject: [Buildroot] [PATCH 0/6 v3] pkg-autotools: introduce infra to
 gettextize packages (branch yem/gettext)
In-Reply-To: <cover.1405547907.git.yann.morin.1998@free.fr>
References: <cover.1405547907.git.yann.morin.1998@free.fr>
Message-ID: <20140717095601.63ff76ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 17 Jul 2014 00:00:29 +0200, Yann E. MORIN wrote:

> This small series introduces the gettextize of a package as an optional
> sequence in the autotools package infra.
> 
> It has been only slightly tested, so is still in RFC stage.
> 
> Three packages have been converted: wget (the historical offender),
> coreutils and parted. Others may need gettextizing, too, but the
> autobuilders (or users) will catch them eventually.

Since this issue was causing some much breakage in the autobuilders,
I've applied your series. If there are some fixes or improvements to be
made, either due to additional review, or additional issues being
discovered, we can handle them as followup patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
