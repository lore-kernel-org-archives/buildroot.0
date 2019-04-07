From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 7 Apr 2019 16:03:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/sunxi-mali: allow EGL type = X11
In-Reply-To: <1531834236-23072-1-git-send-email-inigohuguet@fanamoel.com>
References: <1531834236-23072-1-git-send-email-inigohuguet@fanamoel.com>
Message-ID: <20190407160352.7e094d6c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello I?igo,

On Tue, 17 Jul 2018 15:30:36 +0200
I?igo Huguet <inigohuguet@fanamoel.com> wrote:

> This patch allow to use sunxi-mali for OpenGLES acceleration for
> apps running on top of X11 with EGL interface.
> 
> For example, QT Quick 2 apps have to use GLX or EGL to run in an
> X server, but GLX is not always available, specially in OpenGLES
> only capable systems, like the ones with GPU Mali.
> 
> Signed-off-by: I?igo Huguet <inigohuguet@fanamoel.com>
> ---
>  package/sunxi-mali/Config.in     | 30 ++++++++++++++++++++++++++++++
>  package/sunxi-mali/sunxi-mali.mk | 32 +++++++++++++++++++++++++++-----
>  2 files changed, 57 insertions(+), 5 deletions(-)

Thanks for the patch, but in the mean time, the sunxi-mali package was
removed, in favor of sunxi-mali-mainline.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
