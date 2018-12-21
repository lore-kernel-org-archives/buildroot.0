From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 21 Dec 2018 08:40:00 -0600
Subject: [Buildroot] [PATCH v1] libinput: bump version to 1.12.4
In-Reply-To: <20181220215438.4525-1-ps.report@gmx.net>
References: <20181220215438.4525-1-ps.report@gmx.net>
Message-ID: <CANQCQpaLM54s6_mW1TcMjqU0zwZ--BXuDfy9hNC6KUy1dGLxbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter S,

On Thu, Dec 20, 2018 at 3:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/libinput/libinput.hash | 10 +++++-----
>  package/libinput/libinput.mk   |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
> index 3ead0f0501..6cfb34242f 100644
> --- a/package/libinput/libinput.hash
> +++ b/package/libinput/libinput.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.freedesktop.org/archives/wayland-devel/2018-November/039620.html
> -md5  083d6bf311d5e1e3a62440dc634bb8f0  libinput-1.12.3.tar.xz
> -sha1 0b0b1285589bbe9924af81959ae1e6204e1c8a00  libinput-1.12.3.tar.xz
> -sha256 f266ff861a2e7a97e1402c4345e3547b900efde68adbd40e56403e2617fee255  libinput-1.12.3.tar.xz
> -sha512 cdc512cb53442ae85d5a23e10db9dd3548bcca0de24d7fcc48954a60773563d84d9b10278b6a693ade95d0789bb5d42bbb8b7cf1c178fe85401cb09a5402ff02  libinput-1.12.3.tar.xz
> +# https://lists.freedesktop.org/archives/wayland-devel/2018-December/039782.html
> +md5 8d3c7a7467a45a3ba544d1a745267d38 libinput-1.12.4.tar.xz
> +sha1 9c1a7a2fead7f03eb21a5a0f5ac3bff6af00ebf8 libinput-1.12.4.tar.xz
> +sha256 a4f329641c2e2d98199840f99792f646a3041256a380d074e00200991fcb31e6 libinput-1.12.4.tar.xz
> +sha512 4e43ed5213059a481e5a73549c8325e5729d08512c4f580b924d4338a1b69dabd77fb612bec418f294c1da96c738ce26e45f8de8fbc222ab1af71a1535b3240f libinput-1.12.4.tar.xz

I realize this was just committed, however would you mind sending a
patch to add the license file hash?

Matt
