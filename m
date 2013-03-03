From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Mar 2013 20:09:44 +0100
Subject: [Buildroot] [PATCH 1/2] qt5: add rPi EGL glue code
In-Reply-To: <1362175994-17431-1-git-send-email-bos@je-eigen-domein.nl>
References: <1362175994-17431-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <20130303200944.6a684478@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Floris Bos,

On Fri,  1 Mar 2013 23:13:13 +0100, Floris Bos wrote:
> When the rpi-userland package is selected, assume we are targetting
> the Raspberry Pi, and add the right platform glue code when building
> the Qt5 EGLFS plugin.
> 
> Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Thanks. I've applied your 3 patches (the two ones related to Rasberry
Pi), and the one related to installation of fonts. They will be sent
when I send the next version of my Qt5 pull request.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
