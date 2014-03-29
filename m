From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:24:22 +0100
Subject: [Buildroot] [PATCH 00/91] Update mesa3d & xorg
In-Reply-To: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
References: <BLU0-SMTP39628D1C21A39FA8BD40475D9610@phx.gbl>
Message-ID: <20140329232422.676634a8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 29 Mar 2014 21:56:04 +0100, Bernd Kuhls wrote:

> this is a follow-up patch to replace v8 of my last patch series which
> updated only mesa3d and xserver_xorg-server.
> 
> This patch includes and replaces the forementioned patch series and
> catches, hopefully, all version bumps for xorg packages. Some packages
> had to be patched for compatability with xorg-server 1.15, these patches
> were mostly taken from upstream.

Wow, that was huge. Since the mesa3d patches had already been on the
list since quite some time, and the rest was just bumps, I've applied
the whole thing, with the exception of PATCH 05/91.

I am not sure to understand why the intel driver now unconditionally
needs mesa3d. Also, I wanted to have more details on how to chose
between User-Mode Setting and Kernel-Mode Setting with the intel driver.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
