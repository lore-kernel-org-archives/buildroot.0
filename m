From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 May 2017 15:43:13 +0200
Subject: [Buildroot] [PATCH] libepoxy: make EGL support optional
In-Reply-To: <1495221760-2083-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1495221760-2083-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170523154313.6f00aa8b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 May 2017 21:22:40 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to the libepoxy package to make the EGL
> support optional, which allows libepoxy to build with a pure OpenGL
> Mesa3D configuration (i.e without EGL/OpenGLES).
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/88774af2845e17cab021a72c8f3171fe30b3a1ff/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../libepoxy/0002-Make-EGL-support-optional.patch  | 200 +++++++++++++++++++++
>  package/libepoxy/libepoxy.mk                       |   2 +
>  2 files changed, 202 insertions(+)
>  create mode 100644 package/libepoxy/0002-Make-EGL-support-optional.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
