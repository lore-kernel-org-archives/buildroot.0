From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 16:44:24 +0200
Subject: [Buildroot] [PATCH v7 01/13] mesa3d: Give possibility to
 external backends to enable DRI/Gallium
In-Reply-To: <1430406748-8493-2-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-2-git-send-email-jezz@sysmic.org>
Message-ID: <20150501164424.06a49870@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:16 +0200, J?r?me Pouiller wrote:
> Thus, it is possible to force compilation of Gallium/DRI support in
> mesa3d even if no Gallium/DRI drivers are selected. This is intended to
> be used by external OpenGL provider (especialy further imx6 support).
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> Reviewed-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
>  package/mesa3d/mesa3d.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
