From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Mar 2017 22:25:45 +0100
Subject: [Buildroot] [PATCH] package/fakeroot: backport patch
In-Reply-To: <1489423473-2172-1-git-send-email-yann.morin.1998@free.fr>
References: <1489423473-2172-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170314222545.648ff0c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Mar 2017 17:44:33 +0100, Yann E. MORIN wrote:
> Backport the single change there is between 1.10.2 and 1.21.
> 
> We do not bump to 1.21 because the tarball for 1.21 does not contain the
> generated autostuff, which would require we autoreconf fakeroot, but
> that pulls in dependencies on host-autoconf, host-automake, host-m4 and
> host-libtool, which is a little tiny-weeny bit too much.
> 
> So we just backport that single change.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Andreas Naumann <dev@andin.de>

Since this doesn't solve Andreas problem, what is the remaining
motivation for this patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
