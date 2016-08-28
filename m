From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Aug 2016 15:52:43 +0200
Subject: [Buildroot] [PATCH] libamcodec: fix build with musl
In-Reply-To: <1472301468-30919-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1472301468-30919-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160828155243.35a1d9e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Aug 2016 14:37:48 +0200, Thomas Petazzoni wrote:
> This commit adds a patch to the libamcodec in order to fix the build
> with musl, which was failing due to missing <stdint.h> includes.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/1f3b0d483603fb69765c15c7189ff975b72d09c3/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../0001-Include-stdint.h-where-needed.patch       | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 package/libamcodec/0001-Include-stdint.h-where-needed.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
