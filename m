From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 2 Feb 2016 17:07:01 +0100
Subject: [Buildroot] [PATCH 1/1] package/lcdproc: fix musl build
In-Reply-To: <1454167019-24428-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454167019-24428-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <56B0D425.10304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-01-16 16:16, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/9ce/9cec3bea99f2aa10313da38c1e81655666c774f7/
> http://autobuild.buildroot.net/results/b3d/b3d09286d018e53a6d57f8dd5616010a3b212731/
> http://autobuild.buildroot.net/results/aa2/aa27b150a79b14fe1dda74a56371b4ee35b3ac15/
> and others
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/lcdproc/0002-musl.patch | 102 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 102 insertions(+)
>  create mode 100644 package/lcdproc/0002-musl.patch
> 
> diff --git a/package/lcdproc/0002-musl.patch b/package/lcdproc/0002-musl.patch
> new file mode 100644
> index 0000000..d0425fd
> --- /dev/null
> +++ b/package/lcdproc/0002-musl.patch
> @@ -0,0 +1,102 @@
> +Fix musl build
> +
> +Partly downloaded from
> +http://lists.omnipotent.net/pipermail/lcdproc/2015-November/014291.html
> +http://lists.omnipotent.net/pipermail/lcdproc/2015-November/014281.html
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

 Again, the commit message could be better, but

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout


> +
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
