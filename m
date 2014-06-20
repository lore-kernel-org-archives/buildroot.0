From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 20 Jun 2014 21:03:40 +0200
Subject: [Buildroot] [PATCH] manual/make-tips: fix typo
In-Reply-To: <1403274420-8381-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1403274420-8381-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <CAAXf6LUBWLg+ZEYmsVOqVZ3Yr=zxqptYBXsXanjaB5DXewVb1w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vivien,

On Fri, Jun 20, 2014 at 4:27 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
> ---
>  docs/manual/make-tips.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index 9fabb6f..281b628 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -67,7 +67,7 @@ The manual outputs will be generated in 'output/docs/manual'.
>  - A few tools are required to build the documentation (see:
>    xref:requirement-optional[]).
>
> -.Reseting Buildroot for a new target:
> +.Resetting Buildroot for a new target:
>
>  To delete all build products as well as the configuration:

This problem has already been fixed with commit
b3b4369848e4a4349884499abe9a40f7666389bc.

Best regards,
Thomas
