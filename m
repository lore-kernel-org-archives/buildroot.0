From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 16 Dec 2009 11:29:08 +0200
Subject: [Buildroot] [PATCH 39/39] documentation: slightly improve CSS
In-Reply-To: <a4eee8c3348fd47d84479eef63341779991e9db7.1260905467.git.thomas.petazzoni@free-electrons.com>
References: <cover.1260905467.git.thomas.petazzoni@free-electrons.com>
	<a4eee8c3348fd47d84479eef63341779991e9db7.1260905467.git.thomas.petazzoni@free-electrons.com>
Message-ID: <4B28A864.6090007@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/15/2009 09:31 PM, Thomas Petazzoni wrote:
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>   docs/stylesheet.css |   10 ++++++++++
>   1 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/docs/stylesheet.css b/docs/stylesheet.css
> index 2c36417..ac938c5 100644
> --- a/docs/stylesheet.css
> +++ b/docs/stylesheet.css
> @@ -49,6 +49,16 @@ h3 {
>   	margin-left: 10px;
>   	margin-right: 10px;
>   	color: #336699;
> +        border-bottom: 2px solid #336699;
> +}
> +
> +h4 {
> +	font: italic normal 14pt georgia;
> +	letter-spacing: 1px;
> +	margin-bottom: 0px;
> +	margin-left: 10px;
> +	margin-right: 10px;
> +        border-bottom: 1px dashed black;

Please use tabs *or* spaces for indentation.

>   }
>
>   p {
