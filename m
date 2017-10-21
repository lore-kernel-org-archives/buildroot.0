From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Oct 2017 21:36:29 +0200
Subject: [Buildroot] [PATCH] python-numpy: Bump version to 1.13.3
In-Reply-To: <1508609746-1781-1-git-send-email-abrodkin@synopsys.com>
References: <1508609746-1781-1-git-send-email-abrodkin@synopsys.com>
Message-ID: <20171021213629.3241b52f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 21 Oct 2017 21:15:46 +0300, Alexey Brodkin wrote:
> This is just a bug-fix release.
> 
> Removing 0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch
> as it is a part of the release.
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  ..._npy_scaled_cexp-f-l-is-defined-when-need.patch | 43 ----------------------
>  package/python-numpy/python-numpy.hash             |  4 +-
>  package/python-numpy/python-numpy.mk               |  2 +-
>  3 files changed, 3 insertions(+), 46 deletions(-)
>  delete mode 100644 package/python-numpy/0003-BUG-Ensure-_npy_scaled_cexp-f-l-is-defined-when-need.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
