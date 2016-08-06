From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 6 Aug 2016 17:19:39 +0200
Subject: [Buildroot] [PATCH 07/16 v3] docs/manual: prepare-config can be
 used as a dependency of documents
In-Reply-To: <1b77f6c91b5840d1638aeb3e006621aeb060b02c.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <1b77f6c91b5840d1638aeb3e006621aeb060b02c.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <521139cd-ad91-01dd-0b3e-826278b9b654@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Le 17/07/2016 ? 12:34, Yann E. MORIN a ?crit :

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  docs/manual/adding-packages-asciidoc.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/docs/manual/adding-packages-asciidoc.txt b/docs/manual/adding-packages-asciidoc.txt
> index 0c10fd1..a278d44 100644
> --- a/docs/manual/adding-packages-asciidoc.txt
> +++ b/docs/manual/adding-packages-asciidoc.txt
> @@ -65,6 +65,8 @@ information is (assuming the document name is +foo+) :
>  
>  * +FOO_DEPENDENCIES+, optional, the list of packages (most probably,
>    host-packages) that must be built before building this document.
> +  If a hook of your document needs to access the _Kconfig_ structure,
> +  you may add +prepare-kconfig+ to the list of dependencies.
>  
>  There are also additional hooks (see xref:hooks[] for general information
>  on hooks), that a document may set to define extra actions to be done at
> 
