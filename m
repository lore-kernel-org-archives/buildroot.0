From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Jun 2015 23:14:50 +0200
Subject: [Buildroot] [PATCH] mxml: add hash file
In-Reply-To: <f9e34cbf0944f4f66858c0ec4b4e3d0aa56548eb.1434341549.git.baruch@tkos.co.il>
References: <f9e34cbf0944f4f66858c0ec4b4e3d0aa56548eb.1434341549.git.baruch@tkos.co.il>
Message-ID: <558091CA.3000803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 06:12, Baruch Siach wrote:
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Checked hashes and checked URL.

 Regards,
 Arnout

> ---
>  package/mxml/mxml.hash | 4 ++++
>  1 file changed, 4 insertions(+)
>  create mode 100644 package/mxml/mxml.hash
> 
> diff --git a/package/mxml/mxml.hash b/package/mxml/mxml.hash
> new file mode 100644
> index 000000000000..310e2cae0ad5
> --- /dev/null
> +++ b/package/mxml/mxml.hash
> @@ -0,0 +1,4 @@
> +# From http://www.msweet.org/downloads.php?L+Z3
> +md5 e21cad0f7aacd18f942aa0568a8dee19 mxml-2.9.tar.gz
> +# Locally computed
> +sha256 cded54653c584b24c4a78a7fa1b3b4377d49ac4f451ddf170ebbc8161d85ff92 mxml-2.9.tar.gz


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
