From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 12:04:06 +0100
Subject: [Buildroot] [PATCH 1/1] package: remove the default value of
 the $(PKG)_SOURCE variable
In-Reply-To: <1513506292-27032-1-git-send-email-jerzy.m.grzegorek@gmail.com>
References: <1513506292-27032-1-git-send-email-jerzy.m.grzegorek@gmail.com>
Message-ID: <20171217120406.3c63fe83@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Dec 2017 11:24:52 +0100, Jerzy Grzegorek wrote:
> Signed-off-by: Jerzy Grzegorek <jerzy.m.grzegorek@gmail.com>
> ---
>  package/pimd/pimd.mk                                   | 1 -
>  package/proj/proj.mk                                   | 1 -
>  package/traceroute/traceroute.mk                       | 1 -
>  3 files changed, 3 deletions(-)

Applied to master, thanks. In order to avoid such mistakes in the
future, would you be willing to contribute an addition to the
check-package script that detects usage of the default <pkg>_SOURCE
value ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
