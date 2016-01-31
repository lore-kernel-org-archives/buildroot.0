From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 31 Jan 2016 15:38:02 +0100
Subject: [Buildroot] [PATCH 13/16 v3] core/legal-info: also save extra
 downloads
In-Reply-To: <ae8085eb76c278a3dc76f1fc16ac625589faf4a2.1454004518.git.yann.morin.1998@free.fr>
References: <cover.1454004518.git.yann.morin.1998@free.fr>
 <ae8085eb76c278a3dc76f1fc16ac625589faf4a2.1454004518.git.yann.morin.1998@free.fr>
Message-ID: <56AE1C4A.9080106@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Yann E. MORIN wrote:
> Some packages, like perl, download extra files that end up as part of
> the source that Buildroot builds. Up until now, those files were not
> saved in the legal-info output.
>
> Add those files to the legal-info output.
>
> The unfortunate side-effect is that we will also save the secondary
> archive for the external blackfin toolchains; however, we already do
> save the binary release of some external toolchains when they do not
> provide actual source archives.
>
> This is inherently bad, as those are not source archives, but solving
> this is a bigger concern, for another series...
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

And:
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
