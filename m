From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 10:19:06 +0100
Subject: [Buildroot] [PATCH v2 2/3] e2fsprogs: flat: Add patch to append
 uuid link flag after the blkid link flags when checking the blkid library
 in the FLAT binary mode.
In-Reply-To: <1384506378-2818-2-git-send-email-Sonic.adi@gmail.com>
References: <1384506378-2818-1-git-send-email-Sonic.adi@gmail.com>
 <1384506378-2818-2-git-send-email-Sonic.adi@gmail.com>
Message-ID: <CAAXf6LXU7aYGWCBAhWU-1H6x25a9m51E8UT1giwuM=pb-PzhoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sonic,

On Fri, Nov 15, 2013 at 10:06 AM,  <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  ...ogs-0003-append-uuid-link-flag-for-flat-linker.patch | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch
>
> diff --git a/package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch b/package/e2fsprogs/e2fsprogs-0003-append-uuid-link-flag-for-flat-linker.patch

Thanks for your change.
I see that the e2fsprogs already has a patch, not following the
correct file naming. Do you care to make an extra patch against
buildroot to rename that patch?

Thanks,
Thomas
