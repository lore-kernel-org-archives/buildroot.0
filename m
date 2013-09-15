From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Sep 2013 16:33:37 +0200
Subject: [Buildroot] [RFCv1 07/11] toolchain: intermediate .mk files no
 longer needed
In-Reply-To: <1378416469-17708-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378416469-17708-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LX2SMBFZ_d7WL9YXeyPFq52=63fjWdvxqezzt2e8rCZ8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Sep 5, 2013 at 11:27 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external.mk | 4 ----
>  1 file changed, 4 deletions(-)
>  delete mode 100644 toolchain/toolchain-external.mk
>
> diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
> deleted file mode 100644
> index 2f43db7..0000000
> --- a/toolchain/toolchain-external.mk
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# Required includes for the external toolchain backend
> -
> -include toolchain/helpers.mk
> -include toolchain/toolchain-external/ext-tool.mk
> --

Acked-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
