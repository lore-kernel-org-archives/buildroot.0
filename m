From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Aug 2019 20:28:27 +0200
Subject: [Buildroot] [PATCH v3] package/qt5base: fix libtool la file
 dependency_libs entries
In-Reply-To: <20190801214823.5502-1-ps.report@gmx.net>
References: <20190801214823.5502-1-ps.report@gmx.net>
Message-ID: <cddc101f-d6d7-62bc-a135-c6d09abe1078@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01/08/2019 23:48, Peter Seiderer wrote:
> Fixes [1]:
> 
>   libtool: error: cannot find the library '' or unhandled argument '/.../host/riscv64-buildroot-linux-gnu/sysroot/usr/lib/libQt5Widgets.so'
> 
> Add upstream suggested patch ([2]) to change la file dependency_libs entries
> to -L<path> -l<library> version.
> 
> [1] http://autobuild.buildroot.net/results/79c1e1b7a1bc53c1e9b2ae0c9acb443e6d2e2994
> [2] https://codereview.qt-project.org/c/qt/qtbase/+/269146
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - exchange own patch by new suggested upstream patch (with added
>     upsteam url and signed of by)
> 
> Changes v2 -> v3:
>   - fix commit comment upstream url
>   - add tested by bernd kuhls
