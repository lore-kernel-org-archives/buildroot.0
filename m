From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 15:04:05 +0200
Subject: [Buildroot] [PATCH 1/1] mesa3d: don't remove OpenGL pc when
 installing Gallium
In-Reply-To: <20160601065835.9754-1-akihiko.odaki.4i@stu.hosei.ac.jp>
References: <20160601065835.9754-1-akihiko.odaki.4i@stu.hosei.ac.jp>
Message-ID: <20160705150405.717e8b6c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 15:58:35 +0900, Akihiko Odaki wrote:
> Gallium driver also provides DRI-like infrastructure and OpenGL.
> This change prevents from removing pkg-configs of them also when
> installing the driver.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
> ---
>  package/mesa3d/mesa3d.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
