From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 23 Jun 2016 13:14:17 +0300
Subject: [Buildroot] [PATCH 2/2] pulseaudio: bump version to 9.0
In-Reply-To: <1466676597-7758-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1466676597-7758-1-git-send-email-Vincent.Riera@imgtec.com>
 <1466676597-7758-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160623101417.GB1971@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

On Thu, Jun 23, 2016 at 11:09:57AM +0100, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/pulseaudio/pulseaudio.hash | 4 ++--
>  package/pulseaudio/pulseaudio.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pulseaudio/pulseaudio.hash b/package/pulseaudio/pulseaudio.hash
> index 0d1a3d2..e2312ba 100644
> --- a/package/pulseaudio/pulseaudio.hash
> +++ b/package/pulseaudio/pulseaudio.hash
> @@ -1,3 +1,3 @@
>  # From http://freedesktop.org/software/pulseaudio/releases/pulseaudio-8.0.tar.xz.{md5,sha1}

Please update the hashes source link.

> -md5 8678442ba0bb4b4c33ac6f62542962df  pulseaudio-8.0.tar.xz
> -sha1 1399a2f6288ad743184b6c2192129fef033343ac  pulseaudio-8.0.tar.xz
> +md5 da7162541b3a9bc20576dbd0d7d1489a  pulseaudio-9.0.tar.xz
> +sha1 d9a9d7cb667ed95ee1de4b6544d5c7444c5a0064  pulseaudio-9.0.tar.xz

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
