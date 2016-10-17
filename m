From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Oct 2016 22:20:02 +0200
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix scanpypi path typos
In-Reply-To: <1476638105-2310-1-git-send-email-danomimanchego123@gmail.com>
References: <1476638105-2310-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20ec558a-326e-9b23-b794-e624f51361cc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-10-16 19:15, Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> ---
>  docs/manual/adding-packages-python.txt | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/manual/adding-packages-python.txt b/docs/manual/adding-packages-python.txt
> index 94ac809..ec33483 100644
> --- a/docs/manual/adding-packages-python.txt
> +++ b/docs/manual/adding-packages-python.txt
> @@ -178,7 +178,7 @@ your host.
>  When at the root of your buildroot directory just do :
>  
>  -----------------------
> -./support/script/scanpypi foo bar -o package
> +./support/scripts/scanpypi foo bar -o package
>  -----------------------
>  
>  This will generate packages +python-foo+ and +python-bar+ in the package
> @@ -198,7 +198,7 @@ If your Buildroot package is not in the official Buildroot tree but in
>  a +BR2_EXTERNAL+ tree, use the -o flag as follows:
>  
>  -----------------------
> -./support/script/scanpypi foo bar -o other_package_dir
> +./support/scripts/scanpypi foo bar -o other_package_dir
>  -----------------------
>  
>  This will generate packages +python-foo+ and +python-bar+ in the
> @@ -207,7 +207,7 @@ This will generate packages +python-foo+ and +python-bar+ in the
>  Option +-h+ will list the available options:
>  
>  -----------------------
> -./support/script/scanpypi -h
> +./support/scripts/scanpypi -h
>  -----------------------
>  
>  [[python-package-cffi-backend]]
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
