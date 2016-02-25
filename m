From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 22:41:54 +0100
Subject: [Buildroot] [PATCH v2] webkitgtk24: fix building with rpi
 egl/gles
In-Reply-To: <1455023877-10821-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455023877-10821-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160225224154.2488364f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue,  9 Feb 2016 10:17:57 -0300, Gustavo Zacarias wrote:
> Some egl/gles binary-only implementations need some extra help in the
> form of additional include directories, like rpi-userland. Fixes:
> 
> http://autobuild.buildroot.net/results/083/083ce94b1ac61a60aa16906336612af59e32b18b/
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
> v2: Use pkg-config

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
