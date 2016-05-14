From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 May 2016 15:23:44 +0200
Subject: [Buildroot] [PATH RFC] glmark2: check mesa3d opengl when adding
 drm
In-Reply-To: <1461930052-21032-2-git-send-email-mylene.josserand@free-electrons.com>
References: <1461930052-21032-1-git-send-email-mylene.josserand@free-electrons.com>
 <1461930052-21032-2-git-send-email-mylene.josserand@free-electrons.com>
Message-ID: <20160514152344.771bbe11@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Apr 2016 13:40:52 +0200, Myl?ne Josserand wrote:
> When using Vivante OpenGL, the mesa3d is not enabling gbm which is
> needed by glmark3 with flavor "drm".
> 
> This patch adds a check to enable "drm" flavors only in case of mesa3d
> opengl enabled.
> 
> Signed-off-by: Myl?ne Josserand <mylene.josserand@free-electrons.com>

I *think* this problem is already solved by patch
http://patchwork.ozlabs.org/patch/610921/ from Gustavo, which I have
just applied to our master branch. Let me know if that is not the case.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
