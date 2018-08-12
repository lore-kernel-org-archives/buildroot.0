From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Aug 2018 23:01:44 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/qt5/qt5base: fix statx
 support with glibc >= 2.28
In-Reply-To: <20180812203834.19840-1-bernd.kuhls@t-online.de>
References: <20180812203834.19840-1-bernd.kuhls@t-online.de>
Message-ID: <20180812230144.21788271@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 Aug 2018 22:38:34 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

It seems like
https://github.com/qt/qtbase/commits/5.11/src/corelib/io/qfilesystemengine_unix.cpp
has some proper upstream changes for this. It would make more sense to
backport those fixes, no ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
