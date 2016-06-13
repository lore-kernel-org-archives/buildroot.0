From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jun 2016 09:26:58 +0200
Subject: [Buildroot] [PATCH v2 1/5] package/qt: Add optional support for
 OpenGL
In-Reply-To: <1465762042-18942-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465762042-18942-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160613092658.2d4be0af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Jun 2016 22:07:18 +0200, Bernd Kuhls wrote:
> OpenGL support is only available for the desktop variant of Qt4 and not
> the embedded one: http://code.qt.io/cgit/qt/qt.git/tree/configure#n6612
> 
> This patch is needed to fix a compile error with libv4l which depends
> on OpenGL support if qt4 is used by libv4l as optional dependency.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Not sure this is related directly, but it's Qt/OpenGL related, could
you have a look at:

   http://autobuild.buildroot.net/results/2a8/2a8edb18ab7f8a9e324966282858014e9b5bbea0/build-end.log

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
