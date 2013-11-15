From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 15 Nov 2013 09:40:23 +0100
Subject: [Buildroot] [PATCH 1/3] e2fsprogs: nommu: Add patch to use
 vfork in nommu arch.
In-Reply-To: <1384504293-2067-2-git-send-email-Sonic.adi@gmail.com>
References: <1384504293-2067-1-git-send-email-Sonic.adi@gmail.com>
 <1384504293-2067-2-git-send-email-Sonic.adi@gmail.com>
Message-ID: <CAAXf6LXRCsw+Lk5PDgtdbyFRvvoRUVz78vtG-re-f_wpfPfZZQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sonic,

On Fri, Nov 15, 2013 at 9:31 AM,  <sonic.adi@gmail.com> wrote:
> From: Sonic Zhang <sonic.zhang@analog.com>
>
> Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
> ---
>  package/e2fsprogs/e2fsprogs-nommu.patch | 231 ++++++++++++++++++++++++++++++++
>  1 file changed, 231 insertions(+)
>  create mode 100644 package/e2fsprogs/e2fsprogs-nommu.patch
>
> diff --git a/package/e2fsprogs/e2fsprogs-nommu.patch b/package/e2fsprogs/e2fsprogs-nommu.patch
> new file mode 100644
> index 0000000..6aef365
> --- /dev/null
> +++ b/package/e2fsprogs/e2fsprogs-nommu.patch

The patch itself should also contain a description and a signed-off-by line...

Additionally, patches should be named
<pkg>-<number>-<description>.patch, so for example:
e2fsprogs-0001-add-nommu-support.patch

Best regards,
Thomas
