From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 20 Mar 2019 23:41:52 +0100
Subject: [Buildroot] [PATCH v2 3/4] add myself to DEVELOPERS
In-Reply-To: <20190315133033.5275-4-norbert.lange@andritz.com>
References: <20190315133033.5275-1-norbert.lange@andritz.com>
 <20190315133033.5275-4-norbert.lange@andritz.com>
Message-ID: <714b9965-1fe2-c85c-d3f7-4c3ea2fca0e1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/03/2019 14:30, Norbert Lange wrote:
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  DEVELOPERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8a57cb2e23..ce0e9234d8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1628,6 +1628,7 @@ F:	package/tpm-tools/
>  F:	package/trousers/
>  
>  N:	Norbert Lange <nolange79@gmail.com>
> +F:  package/libfuse3/

 Indent with tab.

 Also, this should be squashed with the previous one (when a package is added,
to the DEVELOPERS entry right away).

 Regards,
 Arnout

>  F:	package/tcf-agent/
>  
>  N:	Olaf Rempel <razzor@kopf-tisch.de>
> 
