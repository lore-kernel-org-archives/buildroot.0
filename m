From: Fatih =?utf-8?q?A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Tue, 13 May 2014 09:49:42 +0300
Subject: [Buildroot] [PATCH 1/1] qtquick1: removed OpenGL dependencies
In-Reply-To: <20140506212121.7a895a27@free-electrons.com>
References: <1399309606-25561-1-git-send-email-wojciech.slenska@gmail.com>
 <20140506212121.7a895a27@free-electrons.com>
Message-ID: <201405130949.42144.fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 06 May 2014 22:21:21 Thomas Petazzoni wrote:
> Dear Wojciech Slenska,
> 
> On Mon,  5 May 2014 19:06:46 +0200, Wojciech Slenska wrote:
> > QtQuick1 module doesn't need OpenGl libs and declarative module.
> > This module can be used to port qt4 qml apps to qt5. Patch has been
> > tested with linuxfb output plugin.
> > 
> > Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> 
> Thanks for this patch. Can qt5quick1 optionally depend on
> qt5declarative?

No. Probably, the library and package names confused me in the past.

BTW, I have noticed a missing dependency of this package 
(BR2_PACKAGE_QT5BASE_NETWORK). I will send a patch for this.

> Fatih, could you review this patch?

Reviewed-by: Fatih A??c? <fatih.asici@gmail.com>

Regards,
Fatih
