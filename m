From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 22:23:42 +0100
Subject: [Buildroot] [PATCH] uclibc: add madvise macro patch from
 upstream
In-Reply-To: <20161127153745.GA27642@waldemar-brodkorb.de>
References: <20161127153745.GA27642@waldemar-brodkorb.de>
Message-ID: <20161127222342.2816bed1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 16:37:45 +0100, Waldemar Brodkorb wrote:
> Fixes:
>   http://autobuild.buildroot.net/results/6f296139633df24031b20d8bd5191e0f5928ec68
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
> upstream patch is not yet pushed.
> ---
>  ...ne-madvise-related-macros-for-noMMU-targe.patch | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/uclibc/0002-do-not-define-madvise-related-macros-for-noMMU-targe.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
