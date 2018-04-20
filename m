From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Fri, 20 Apr 2018 11:06:06 +0530
Subject: [Buildroot] [PATCH v2] dhcpcd: fix legal info
In-Reply-To: <50e5f9d5db91fc7ab921a69fe1eead1d78a9cfad.1524201815.git.baruch@tkos.co.il>
References: <50e5f9d5db91fc7ab921a69fe1eead1d78a9cfad.1524201815.git.baruch@tkos.co.il>
Message-ID: <CA+NV+VnsOzjMBePoz2bZHbwAEYZJ-pkU3P90zTjz196RYwim0g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 20, 2018 at 10:53 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> The latest version bump to 7.0.3 moved dhcpcd.c to under src/. Since the
> tarball now has a LICENSE file, use that instead.
>
> While at it, add a hash for that file.
>
> Fixes:
> http://autobuild.buildroot.net/results/f57/f5790e0a82a3b814d828d18eb71a3f6c422bb2b8/
> http://autobuild.buildroot.net/results/6b9/6b930827913f9b4d2602d5777f4243ba7b295ca7/
> http://autobuild.buildroot.net/results/603/603eda004a502f613e9b92cea4fb8cc9e4068255/
>
> Cc: John Stile <johns@msli.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Reviewed-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>

Thanks,
Rahul
