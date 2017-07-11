From: Joshua Henderson <joshua.henderson@microchip.com>
Date: Mon, 10 Jul 2017 17:00:51 -0700
Subject: [Buildroot] [PATCH 2/2] qt5: bump to 5.9.1
In-Reply-To: <79ab1fe5-2dac-abde-15b0-a985b9e37959@ecagroup.com>
References: <1499399077-3542-1-git-send-email-brents_3@hotmail.com>
 <DM5PR03MB2924FBF3A3BF12875E828F5BBFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
 <79ab1fe5-2dac-abde-15b0-a985b9e37959@ecagroup.com>
Message-ID: <22a46dfc-6665-4a13-e5e9-5e59280cbd37@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On 07/10/2017 05:02 AM, Julien CORJON wrote:
> Brand,
> 
> In addition to Ga?l comments.
> 
> You should remove package/qt5/qt5base/5.8.0 folder as all patches have 
> been Mainlined :
>    - 0001-fix-parallel-builds-with-qt-freetype-system-libpng.patch (See 
> https://code.qt.io/cgit/qt/qtbase.git/commit/?id=4dcfd90e4fd7d4c49138038dbbcbda8794a9fbff)
>    - 0002-fix-VNC-platform-plugin-build-on-big-endian-machines.patch 
> (See 
> http://code.qt.io/cgit/qt/qtbase.git/patch/?id=6f64bfa654fb7e20bb75ec3b0544b81482babb44)
>    - 0003-eglfs-fix-x11-header-related-compile-failure.patch (See 
> https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e9a7739e77f79baeb5452189b6d17e63de5b341d)
>    - 0003-QAtomic-pass-explicit-failure-mode-to-std-atomic-com.patch 
> (See 
> https://code.qt.io/cgit/qt/qtbase.git/commit/?id=e8dc9ba49f22138228342c2c6473e7589d1dca94)
>    - 0004-examples-fix-compile-without-gui-module.patch (See 
> https://code.qt.io/cgit/qt/qtbase.git/commit/examples/gui/gui.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269 
> and 
> https://code.qt.io/cgit/qt/qtbase.git/commit/examples/widgets/widgets.pro?id=18d49808db46add078d9d4bcffaac5361d5c7269)
> 

Noticed the last one is not actually upstream for 5.8 (if it matters):

    0004-examples-fix-compile-without-gui-module.patch
    examples: fix compile without gui module (18d49808d).

It only seems to be available upstream for 5.9.  Should the 5.8.0 folder
still be removed?

Josh
