From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:27:04 +0100
Subject: [Buildroot] [PATCH 1/2] mesa3d-headers: fix installation of
 dri.pc
In-Reply-To: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170215212704.4a12941a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 16:30:47 +0100, Thomas Petazzoni wrote:
> /usr/lib/pkg-config/ is not the correct installation path for .pc files,
> it should be in /usr/lib/pkgconfig/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
