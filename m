From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:23:39 +0100
Subject: [Buildroot] [PATCH] package/weston: fix build without EGL
In-Reply-To: <1479034055-703-1-git-send-email-yann.morin.1998@free.fr>
References: <1479034055-703-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20161113122339.4b6f1b32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Nov 2016 11:47:35 +0100, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/378/378ffddcebd0ab3dabfdb268614d1344a38e8dd1/
>     http://autobuild.buildroot.org/results/3c2/3c25333d3c5838bea27540d8ac752c8bdf4db843/
>     [...]
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...form-include-weston-egl-ext.h-only-if-ENA.patch | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 package/weston/0002-shared-platform-include-weston-egl-ext.h-only-if-ENA.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
