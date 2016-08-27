From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 14:45:25 +0200
Subject: [Buildroot] [PATCH] norm: add patch to fix musl build
In-Reply-To: <1472242094-7204-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472242094-7204-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160827144525.340fa731@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 26 Aug 2016 22:08:14 +0200, Thomas Petazzoni wrote:
> Fixes:
> 
>   http://autobuild.buildroot.net/results/9c7130d5b5aad218c5c576761d495a3f403fdc5b/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  ...03-remove-kernel-headers-include-musl-fix.patch | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 package/norm/0003-remove-kernel-headers-include-musl-fix.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
