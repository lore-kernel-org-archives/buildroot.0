From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:17:57 +0200
Subject: [Buildroot] [PATCH 2/2] package/nvidia-driver: add glesv2.pc
In-Reply-To: <20170419123214.18835-2-bernd.kuhls@t-online.de>
References: <20170419123214.18835-1-bernd.kuhls@t-online.de>
 <20170419123214.18835-2-bernd.kuhls@t-online.de>
Message-ID: <20170504231757.029006f1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 14:32:14 +0200, Bernd Kuhls wrote:

> +Libs: -L${libdir} -lGLESv1_CM

This looks wrong for glesv2.pc, it should point go the OpenGL ES v2
library.

Perhaps you want to do like the nvidia-tegra package, with gles.pc and
glesv2.pc.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
