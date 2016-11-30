From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:58:09 +0100
Subject: [Buildroot] [PATCH] Revert "jasper: Disable debugging when
 building for xtensa"
In-Reply-To: <1480370070-21452-1-git-send-email-jcmvbkbc@gmail.com>
References: <1480370070-21452-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20161130225809.3fe13bbc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Nov 2016 13:54:30 -0800, Max Filippov wrote:
> This reverts commit 71d9b0c1f06896f113b09e941aa84d979bff5710.
> Now that -mauto-litpools is in TARGET_ABI when building for xtensa, -O0
> builds succeed, so this workaround is no longer needed.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  package/jasper/jasper.mk | 6 ------
>  1 file changed, 6 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
