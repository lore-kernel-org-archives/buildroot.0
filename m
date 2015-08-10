From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Aug 2015 15:39:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: needs dynamic library
In-Reply-To: <1439150940-5033-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439150940-5033-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150810153918.033a6328@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun,  9 Aug 2015 22:09:00 +0200, Bernd Kuhls wrote:
> Also propagate to reverse dependencies, to keep bisectability do this in
> one commit.

Propagating to the reverse dependencies was not needed, since they are
not selecting mesa3d, they only "depends on" it.

> 
> Fixes
> http://autobuild.buildroot.net/results/5ee/5eef099e82e7a65d9b459d88fcb82b468ccf8fed/
> http://autobuild.buildroot.net/results/e5c/e5c0e693505798ec366328ed87de3460cd07894d/
> http://autobuild.buildroot.net/results/c6b/c6b6a21f73fc84f4784dd00de504ef0eea3bdaf1/
> http://autobuild.buildroot.net/results/abd/abd3e2850ee457fc456de3f1641b92405d995e16/
> http://autobuild.buildroot.net/results/2c4/2c40fe209e6006fdf148e547b1fafe9180afc85d/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I've applied after removing the changes from glmark2/Config.in and
mesa3d-demos/Config.in.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
