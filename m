From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 May 2015 22:49:32 +0200
Subject: [Buildroot] [PATCH v7 08/13] qt5base: fix compilation with
 Vivante headers.
In-Reply-To: <1430406748-8493-9-git-send-email-jezz@sysmic.org>
References: <1430406748-8493-1-git-send-email-jezz@sysmic.org>
 <1430406748-8493-9-git-send-email-jezz@sysmic.org>
Message-ID: <20150501224932.5c2422b7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Thu, 30 Apr 2015 17:12:23 +0200, J?r?me Pouiller wrote:
> Tested-by: Gary Bisson <gary.bisson@boundarydevices.com>
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/qt5/qt5base/0004-xcb-egl-fixes.patch | 63 ++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/qt5/qt5base/0004-xcb-egl-fixes.patch

Applied, thanks. Do you think we can upstream this patch to Qt5?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
