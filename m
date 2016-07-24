From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 16:30:19 +0200
Subject: [Buildroot] [PATCH] omniorb: add patch to fix musl build
In-Reply-To: <1469052561-19361-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1469052561-19361-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160724163019.257f3d69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 21 Jul 2016 00:09:21 +0200, Thomas Petazzoni wrote:
> Fixes:
> 
>   http://autobuild.buildroot.net/results/0e2025cbc1c54f0c177ce3f27020d454aa03645a/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-fix-unistd-sys-time-includes.patch        | 61 ++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 package/omniorb/0001-fix-unistd-sys-time-includes.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
