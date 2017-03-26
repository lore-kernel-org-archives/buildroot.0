From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Mar 2017 22:36:47 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: remove sha1 external
 dependency
In-Reply-To: <20170326201744.12202-1-romain.naour@gmail.com>
References: <20170326201744.12202-1-romain.naour@gmail.com>
Message-ID: <20170326223647.7e9f219d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 26 Mar 2017 22:17:44 +0200, Romain Naour wrote:
> --with-sha1 option was removed since mesa 1.17.0 by commit [1].
> 
> [1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=d1efa09d342bff3e5def2978a0bef748d74f9c82
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d/mesa3d.mk | 11 -----------
>  1 file changed, 11 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
