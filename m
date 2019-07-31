From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 31 Jul 2019 08:06:19 +0200
Subject: [Buildroot] [PATCH v1] package/qt5base: fix libtool la file
 dependency_libs entries
References: <20190730212522.29386-1-ps.report@gmx.net>
Message-ID: <rnn71gx36n.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 30 Jul 2019 23:25:22 +0200 schrieb Peter Seiderer:

> Fixes [1]:
> 
>   libtool:   error: cannot find the library '' or unhandled argument
>   '/.../host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/
libQt5Widgets.so'
> 
> Add upstream suggested patch ([2]) to  change la file dependency_libs
> entries to -L<path> -l<library> version.
> 
> [1]
> http://autobuild.buildroot.net/results/
79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994
> [2] https://codereview.qt-project.org/c/qt/qtbase/+/269110
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Tested-by: Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Fixes: http://autobuild.buildroot.net/results/c9b/
c9be4ef68c9c5d018e4084c52215ce69f0c72538/
