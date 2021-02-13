From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 23:40:21 +0100
Subject: [Buildroot] [PATCH/next v1 1/7] package/libubox: bump version
 to 5bc0146a
In-Reply-To: <20210210231640.5262-1-ps.report@gmx.net>
References: <20210210231640.5262-1-ps.report@gmx.net>
Message-ID: <20210213234021.0b3b8bc1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 11 Feb 2021 00:16:34 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> - change download url to https
> 
> - update homepage url (the old one returns 404 - No projects found)
> 
> - add hash file
> 
> - delete 0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
>   (from upstream [1])
> 
> [1] https://git.openwrt.org/?p=project/libubox.git;a=commit;h=eb7eb6393d47a918c420f5b287946dbd6c0d5f57
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  ...x-array-out-of-bounds-GCC-10-warning.patch | 47 -------------------
>  package/libubox/Config.in                     |  2 +-
>  package/libubox/libubox.hash                  |  2 +
>  package/libubox/libubox.mk                    |  5 +-
>  4 files changed, 6 insertions(+), 50 deletions(-)
>  delete mode 100644 package/libubox/0001-blobmsg-fix-array-out-of-bounds-GCC-10-warning.patch
>  create mode 100644 package/libubox/libubox.hash

Thanks, series applied to next. There was an issue on ustream-ssl
though: the license file had changed, and you had not updated the hash.
I fixed that up when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
