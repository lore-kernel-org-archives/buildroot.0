From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 22:48:13 +0200
Subject: [Buildroot] [PATCH 2/2] openal: Use upstream patch to detect
 run-time NEON support
In-Reply-To: <1473608941-24674-2-git-send-email-nerv@dawncrow.de>
References: <1473608941-24674-1-git-send-email-nerv@dawncrow.de>
 <1473608941-24674-2-git-send-email-nerv@dawncrow.de>
Message-ID: <20160911224813.644afbc1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 17:49:01 +0200, Andr? Hentschel wrote:
> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  .../0003-Check-for-run-time-NEON-support.patch     | 63 ++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 package/openal/0003-Check-for-run-time-NEON-support.patch

Applied after changing from having the patch inside Buildroot to
downloading the patches from Github directly.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
