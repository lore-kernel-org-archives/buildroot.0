From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Apr 2015 06:25:40 +0300
Subject: [Buildroot] [PATCH 1/1] monit: bump to version 3.12.2
In-Reply-To: <1429129390-28278-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
References: <1429129390-28278-1-git-send-email-sebastien.bourdelin@savoirfairelinux.com>
Message-ID: <20150416032540.GH30380@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sebastien,

On Wed, Apr 15, 2015 at 04:23:10PM -0400, Sebastien Bourdelin wrote:
> Also add hash file and remove the m4 directory creation from the monit.mk
> which is now in the source tree.
> 
> Signed-off-by: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
> ---
>  package/monit/monit.hash | 6 ++++++
>  package/monit/monit.mk   | 8 +-------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>  create mode 100644 package/monit/monit.hash
> 
> diff --git a/package/monit/monit.hash b/package/monit/monit.hash
> new file mode 100644
> index 0000000..9313c7a
> --- /dev/null
> +++ b/package/monit/monit.hash
> @@ -0,0 +1,6 @@
> +# From https://mmonit.com/monit/dist/monit-5.12.2.tar.gz.sha256:
> +sha256	8ab0296d1aa2351b1573481592d7b5e06de1edd49dff1b5552839605a450914c  monit-5.12.2.tar.gz
> +
> +# Locally calculated:
> +md5	5f5cf4c18b42e8091b49b4e07cf972ce	monit-5.12.2.tar.gz
> +sha1	5ffdcc0c5dfbc12bfe2e35dd33d2626a038771fc	monit-5.12.2.tar.gz

Since we have an upstream hash that is also sha256, there is no need to add 
locally calculated hashes.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
