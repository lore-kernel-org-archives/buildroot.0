From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Jul 2013 16:13:20 +0200
Subject: [Buildroot] [PATCH v5 3/3] qt: add powervr and opengl
In-Reply-To: <1373639678-7357-3-git-send-email-spenser@gillilanding.com>
References: <1373639678-7357-1-git-send-email-spenser@gillilanding.com>
 <1373639678-7357-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20130713161320.4a7174b3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Fri, 12 Jul 2013 09:34:38 -0500, Spenser Gilliland wrote:
> Use the following to test:
> /usr/share/qt/examples/opengl/hellogl_es2/hellogl_es2 -qws -display powervr
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Sundareson, Prabindh <prabu@ti.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Sinan Akpolat <sinan@linkas.com.tr>
> ---
>  package/qt/Config.gfx.in                |   5 +
>  package/qt/Config.in                    |   8 +
>  package/qt/powervr.ini                  |   2 +
>  package/qt/qt-eglwsegl-use-system.patch | 802 ++++++++++++++++++++++++++++++++

In the patch set I had sent to you privately about Qt4/PowerVR, there
was an additional patch, which was really necessary. Why did you remove
it?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
