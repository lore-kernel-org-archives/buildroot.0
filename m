From: Julien CORJON <corjon.j@ecagroup.com>
Date: Mon, 10 Jul 2017 12:02:24 +0000
Subject: [Buildroot] [PATCH 2/2] qt5: bump to 5.9.1
In-Reply-To: <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
References: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
 <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
Message-ID: <79ab1fe5-2dac-abde-15b0-a985b9e37959@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brand,

In addition to Ga?l comments.

You should remove package/qt5/qt5base/5.8.0 folder as all patches have 
been Mainlined :
   - 0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch (See 
https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff)
   - 0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch 
(See 
http://code.qt.io/cgit/qt/qtbase.git/patch/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44)
   - 0003-eglfs-fix-x11-header-related-compile-failure.patch (See 
https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e9a7739e77f79baeb5452189b6d17e63de5b341d)
   - 0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch 
(See 
https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e8dc9ba49f22138228342c2c6473e7589d1dca94)
   - 0004-examples-fix-compile-without-gui-module.patch (See 
https://code.qt.io/cgit/qt/qtbase.git/commit/examples/gui/gui.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269 
and 
https://code.qt.io/cgit/qt/qtbase.git/commit/examples/widgets/widgets.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269)

Also you should rebase your patch on top of master and update hashes for 
package/st5/qt5virtualkeyboard.

Regards,

Julien
