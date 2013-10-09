From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 9 Oct 2013 12:26:09 +0200
Subject: [Buildroot] [PATCH 1/1] manual generation : python-argparse is
 needed with older phyton releases.
In-Reply-To: <1381311422-31077-1-git-send-email-sagaert.johan@skynet.be>
References: <1381311422-31077-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <CAAXf6LVX6TMMHFczEB=V790eqcTaxeN2-WO+68oCDKn2z4xWvw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

On Wed, Oct 9, 2013 at 11:37 AM, Sagaert Johan <sagaert.johan@skynet.be> wrote:
> Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> ---
>  docs/manual/prerequisite.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/manual/prerequisite.txt b/docs/manual/prerequisite.txt
> index 78ce436..1fc1a29 100644
> --- a/docs/manual/prerequisite.txt
> +++ b/docs/manual/prerequisite.txt
> @@ -77,3 +77,4 @@ development context (further details: refer to xref:download-infra[]).
>
>  * Documentation generation tools:
>  ** +asciidoc+
> +** +python-argparse+
> --

Thanks for this change, however it is already part of the following patch:
http://patchwork.ozlabs.org/patch/280931/

Best regards,
Thomas
