From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 21 Dec 2020 13:59:54 +0100
Subject: [Buildroot] [PATCH 3/4 v3] package/qt5base: fix build with TI
 SGX GL stack
In-Reply-To: <1de649c8ea0220479966b7f1a406355f42ea5707.1607810474.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 12 Dec 2020 23:01:25 +0100")
References: <cover.1607810474.git.yann.morin.1998@free.fr>
 <1de649c8ea0220479966b7f1a406355f42ea5707.1607810474.git.yann.morin.1998@free.fr>
Message-ID: <87k0tbpb5h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > qt5base FTBFS with TI SGX GL stack because it defines a type that is
 > incompatible with that expected by Qt.

 > Fix that by adapting a mix of upstream bug reports, upstream tentative
 > patch, and various comments on various Qt forums, none of which were
 > satisfying for various reasons explained in each resource:

 >   - https://bugreports.qt.io/browse/QTBUG-72567
 >   - https://codereview.qt-project.org/c/qt/qtbase/+/248270
 >   - https://forum.qt.io/topic/88588/qtbase-compilation-error-with-device-linux-rasp-pi3-g-qeglfskmsgbmwindow-cpp/8
 >   - https://forum.qt.io/topic/91596/raspberry-pi-3-compiling-qt-5-11-0-problem/6
 >   - https://patchwork.ozlabs.org/project/buildroot/patch/20200702201125.3639873-1-aduskett at gmail.com/#2579598

 > ... which, mixed together with my little understanding of Qt, GL, and
 > C++, gave a relatively simple patch that overcomes the build failure on
 > TI's SGX, while at the same time keeping buildability and functionality
 > on other platforms.

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Adam Duskett <aduskett@gmail.com>
 > Cc: Markus <zehnder@live.com>

Committed to 2020.02.x, 2020.08.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
