From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:42:32 +0100
Subject: [Buildroot] [PATCH 1/2] package/matchbox-desktop: remove
 unrecognized option
In-Reply-To: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
References: <20191030092245.10235-1-fontaine.fabrice@gmail.com>
Message-ID: <20191208144232.07282f59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Oct 2019 10:22:44 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> --enable-expat is not a recognized option so remove it
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/matchbox-desktop/matchbox-desktop.mk | 1 -
>  1 file changed, 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
