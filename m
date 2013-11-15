From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 09:56:28 +0100
Subject: [Buildroot] [PATCH 2/3] e2fsprogs: flat: Add patch to append
 uuid link flag after the blkid link flags when checking the blkid library
 in the FLAT binary mode.
In-Reply-To: <1384504293-2067-3-git-send-email-Sonic.adi@gmail.com>
References: <1384504293-2067-1-git-send-email-Sonic.adi@gmail.com>
 <1384504293-2067-3-git-send-email-Sonic.adi@gmail.com>
Message-ID: <CAAXf6LV0gnueNhrzcZbrmXS9NrjyKFUFit5Ecu0UKdy7HTxJFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 15, 2013 at 9:31 AM,  <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/e2fsprogs/e2fsprogs-flat.patch | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 package/e2fsprogs/e2fsprogs-flat.patch
>

Same comment on the naming of the patch and the patch header.

Best regards,
Thomas
