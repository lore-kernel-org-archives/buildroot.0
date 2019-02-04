From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 4 Feb 2019 15:24:25 +0100
Subject: [Buildroot] [PATCH 1/2] support/scripts/graph-build-time: add
 download times
In-Reply-To: <20190130201156.5927-1-patrickdepinguin@gmail.com>
References: <20190130201156.5927-1-patrickdepinguin@gmail.com>
Message-ID: <e757a5bb-1841-a625-eb47-4f53f4a65290@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/01/2019 21:11, Thomas De Schampheleire wrote:
> From: Mathias De Mare <mathias.de_mare@nokia.com>
> 
> Total build time also involves download. Getting a visibility on the impact
> of that step can be important for users/admins, e.g. to evaluate different
> methods of BR2_PRIMARY_SITE.
> 
> Colors used are some kind of purple (primary scheme) and light orange
> (alternate scheme).
> 
> Signed-off-by: Mathias De Mar? <mathias.de_mare@nokia.com>
> [ThomasDS: rebase and update colors to avoid confusion]
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

 Both applied to master, thanks.

 Regards,
 Arnout

> ---
>  support/scripts/graph-build-time | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/support/scripts/graph-build-time b/support/scripts/graph-build-time
> index 892e08bf07..2fdb6a476d 100755
> --- a/support/scripts/graph-build-time
> +++ b/support/scripts/graph-build-time
> @@ -69,14 +69,14 @@ import matplotlib.font_manager as fm  # noqa: E402
>  import csv                            # noqa: E402
>  import argparse                       # noqa: E402
>  
> -steps = ['extract', 'patch', 'configure', 'build',
> +steps = ['download', 'extract', 'patch', 'configure', 'build',
>           'install-target', 'install-staging', 'install-images',
>           'install-host']
>  
> -default_colors = ['#e60004', '#009836', '#2e1d86', '#ffed00',
> +default_colors = ['#8d02ff', '#e60004', '#009836', '#2e1d86', '#ffed00',
>                    '#0068b5', '#f28e00', '#940084', '#97c000']
>  
> -alternate_colors = ['#00e0e0', '#3f7f7f', '#ff0000', '#00c000',
> +alternate_colors = ['#ffbe0a', '#00e0e0', '#3f7f7f', '#ff0000', '#00c000',
>                      '#0080ff', '#c000ff', '#00eeee', '#e0e000']
>  
>  
> 
