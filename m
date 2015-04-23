From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Apr 2015 17:24:11 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: update musl-cross
 toolchain to 1.1.6
In-Reply-To: <1429795630-39235-1-git-send-email-will_wagner@carallon.com>
References: <1429795630-39235-1-git-send-email-will_wagner@carallon.com>
Message-ID: <20150423172411.5ab8871f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear will_wagner at carallon.com,

On Thu, 23 Apr 2015 14:27:10 +0100, will_wagner at carallon.com wrote:
> From: Will Wagner <will_wagner@carallon.com>
> 
> The 1.1.6 version of musl-cross fixes the two issues that had been
> preventing versions after 1.1.1 being used by buildroot, namely:
> - sysroot is enabled again
> - kernel headers are included again
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  toolchain/toolchain-external/Config.in             | 6 +++---
>  toolchain/toolchain-external/toolchain-external.mk | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
