From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Fri, 28 Jul 2017 16:15:50 -0700
Subject: [Buildroot] [PATCH 1/1] systemd: bump version to 234
In-Reply-To: <20170728113516.17944-1-aduskett@gmail.com>
References: <20170728113516.17944-1-aduskett@gmail.com>
Message-ID: <CAHQ1cqHZy80CxohSYkEtGNwfHw8-7=ihjqbTSbsh5iyZchX8eQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 28, 2017 at 4:35 AM, Adam Duskett <aduskett@gmail.com> wrote:
> Other changes:
> - Removed the following patches due to being merged upstream:
>     - resolved-bugfix-of-null-pointer-p-question-dereferencing.patch
>     - resolved-simplify-alloc-size-calculation.patch
>     - resolved-do-not-allocate-packets-with-minimum-size.patch
> - Updated the following patches to work with 234:
>     - fix-getty-unit.patch
>     - build-check-for-ln-relative.patch
>     - fix-am-path-libgcrypt-no-found.patch
> - Updated ordering of remaining patches.
> - Reformatted remaining patches as git style patches.
> - Updated Upstream-Status comment in "build-check-for-ln-relative.patch" to
>   "Denied [No desire to support building on old distributions]"
>
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Adam,

Any chance you can also update "python-systemd" as a part of this patch/series?

Thanks,
Andrey Smirnov
