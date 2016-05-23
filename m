From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 20:08:33 +0200
Subject: [Buildroot] [PATCH: for-next] toolchain-external: bump
 CodeSourcery NIOSII to 2016.05
In-Reply-To: <1463610210-657-1-git-send-email-romain.naour@gmail.com>
References: <1463610210-657-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160523200833.40b64220@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 00:23:30 +0200, Romain Naour wrote:
> The toolchain still use binutils 2.25 without the fix for PR19405.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  toolchain/toolchain-external/Config.in               | 8 ++++----
>  toolchain/toolchain-external/toolchain-external.hash | 4 ++--
>  toolchain/toolchain-external/toolchain-external.mk   | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
