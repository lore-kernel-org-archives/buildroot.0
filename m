From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 15:13:18 +0100
Subject: [Buildroot] [PATCH 2/3] package/sysdig: disable all bundled
 dependencies
In-Reply-To: <20191207191704.647337-2-fontaine.fabrice@gmail.com>
References: <20191207191704.647337-1-fontaine.fabrice@gmail.com>
 <20191207191704.647337-2-fontaine.fabrice@gmail.com>
Message-ID: <20191208151318.4d1404b6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Dec 2019 20:17:03 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Disable all dependencies through -DUSE_BUNDLED_DEPS=OFF instead of
> disabling them one by one
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/sysdig/sysdig.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
