From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 01:58:11 -0500
Subject: [Buildroot] [PATCH] package/gst1-plugins-bayer2rgb-neon: remove
 'v' prefix from github-fetched packages
In-Reply-To: <20191027064805.15514-1-matthew.weber@rockwellcollins.com>
References: <20191027064805.15514-1-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZjaDeDqKXEtfi76HrsXptQ5oFGq4s-MjKPYabcAcNv3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Title of this one can drop the github part (cut/paste error)

On Sun, Oct 27, 2019 at 1:48 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Fixes version parsing for release-monitoring.org support.
>
> Cc: Heiko Thiery <heiko.thiery@kontron.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  .../gst1-plugins-bayer2rgb-neon.mk                            | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
> index e430865e31..d6c3c36272 100644
> --- a/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
> +++ b/package/gstreamer1/gst1-plugins-bayer2rgb-neon/gst1-plugins-bayer2rgb-neon.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -GST1_PLUGINS_BAYER2RGB_NEON_VERSION = v0.3
> -GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
> +GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.3
> +GST1_PLUGINS_BAYER2RGB_NEON_SOURCE = gst-bayer2rgb-neon-v$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
>  GST1_PLUGINS_BAYER2RGB_NEON_SITE = https://git.phytec.de/gst-bayer2rgb-neon/snapshot
>  GST1_PLUGINS_BAYER2RGB_NEON_LICENSE = GPL-3.0
>  GST1_PLUGINS_BAYER2RGB_NEON_LICENSE_FILES = COPYING
> --
> 2.17.1
>


-- 

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
