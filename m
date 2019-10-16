From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 21:55:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-good: add
 TARGET_NLS_DEPENDENCIES
In-Reply-To: <20191016165819.2740-1-fontaine.fabrice@gmail.com>
References: <20191016165819.2740-1-fontaine.fabrice@gmail.com>
Message-ID: <20191016215525.774608e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 16 Oct 2019 18:58:19 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> gst1-plugins-good uses TARGET_NLS_LIBS without depending on
> TARGET_NLS_DEPENDENCIES, fix this mistake
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-good/gst1-plugins-good.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
