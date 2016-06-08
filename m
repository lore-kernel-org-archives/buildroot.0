From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jun 2016 14:08:37 +0200
Subject: [Buildroot] [PATCH 1/1] mesa3d: Add drm to EGL platforms for VC4
In-Reply-To: <20160601065655.9576-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601065655.9576-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160608140837.38cf96a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 15:56:55 +0900, Akihiko Odaki wrote:
> VC4 is a DRM driver.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> ---
>  package/mesa3d/mesa3d.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
