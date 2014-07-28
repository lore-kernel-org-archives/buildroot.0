From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 20:52:07 +0200
Subject: [Buildroot] [PATCH] ltris: needs MMU
In-Reply-To: <1406555895-2671-1-git-send-email-yuvaraj.patil@wipro.com>
References: <1406555895-2671-1-git-send-email-yuvaraj.patil@wipro.com>
Message-ID: <20140728205207.50c9238a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yuvaraj Patil,

On Mon, 28 Jul 2014 19:28:14 +0530, Yuvaraj Patil wrote:
> This package needs MMU. Hence added dependency on BR2_USE_MMU
> 
> Fixes:
> http://autobuild.buildroot.net/results/5cf/5cf2262460a72ce51b479a42fca61cea5f6e23fd//
> 
> Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
> ---
>  package/ltris/Config.in |    1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
