From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Mar 2020 23:03:20 +0100
Subject: [Buildroot] [PATCH v6 23/28] package/qt5webengine: add
 libXdamage as XCB dependency
In-Reply-To: <f5dd2d50-0edb-6819-5a12-61675c601363@andin.de>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-24-anaumann@ultratronik.de>
 <20200312091553.5498289b@windsurf>
 <2edb848b-0d0f-2c01-edc5-7e412c83ba11@andin.de>
 <f5dd2d50-0edb-6819-5a12-61675c601363@andin.de>
Message-ID: <20200322230320.0c0e91e3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Mar 2020 22:58:19 +0100
Andreas Naumann <dev@andin.de> wrote:

> I now realize my configuration had mesa3d without 
> BR2_PACKAGE_MESA3D_OPENGL_GLX. Once selected, it pulls in libxdamage and 
> it gets build before mesa. So the first part of my patch might really 
> not be needed.
> 
> The second part (the dependency) however is needed because otherwise it 
> wont be available in the per-package sysroot of qt5webengine. I guess I 
> should have pointed that out in the commit message. Do you want me to 
> resend?

Yes, please. Could you also include in the commit log the defconfig
that allows to reproduce the issue ?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
