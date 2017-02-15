From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 21:27:06 +0100
Subject: [Buildroot] [PATCH 2/2] mesa3d-headers: remove installation of
 OpenVG headers
In-Reply-To: <1487172648-5292-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1487172648-5292-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1487172648-5292-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170215212706.4904d504@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Feb 2017 16:30:48 +0100, Thomas Petazzoni wrote:
> OpenVG support has been completely removed from mesa3d in commit
> 3acd7a34ab05b87521b74f626ec637e7fdcc6595, merged in mesa-10.6.0.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 4 ----
>  1 file changed, 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
