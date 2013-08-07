From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 7 Aug 2013 08:18:12 +0200
Subject: [Buildroot] [PATCH 4/5] manual: add tips to build manual
In-Reply-To: <1375824984-8226-5-git-send-email-s.martin49@gmail.com>
References: <1375824984-8226-1-git-send-email-s.martin49@gmail.com>
 <1375824984-8226-5-git-send-email-s.martin49@gmail.com>
Message-ID: <CAAXf6LXWdEJsQ4YR8pN8N7szUD-V4xnosYwMuReX1fAchHhorQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 6, 2013 at 11:36 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> From: "A.R.D" <contact@team-ard.com>
>
> Signed-off-by: A.R.D. <contact@team-ard.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>
> ---
> Changes v1 -> v2 (Samuel):
> - split patch
> - rephrase commit message
> - wrap line at 70-80 chars
> - misc. typo and formating fixes
> - misc. rewordings
> ---
>  docs/manual/make-tips.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/docs/manual/make-tips.txt b/docs/manual/make-tips.txt
> index b4a9c12..e1af62a 100644
> --- a/docs/manual/make-tips.txt
> +++ b/docs/manual/make-tips.txt
> @@ -54,6 +54,21 @@ and target trees, the images and the toolchain):
>   $ make clean
>  --------------------
>
> +.Generating the manual:
> +
> +The present manual sources are located in the 'docs/manual' directory.
> +To generate the manual:
> +
> +---------------------------------
> + $ make manual-clean
> + $ make manual
> +---------------------------------
> +
> +The manual outputs will generated in 'output/docs/manual'.

will be

> +
> +*Note* : +asciidoc+ is required to build it. There is a known issue
> +that you can't build it under Dedian Squeeze.

(I should have read the patches in order)
This should probably be Debian.

> +
>  To delete all build products as well as the configuration:
>
>  --------------------


Best regards,
Thomas
