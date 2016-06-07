From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Jun 2016 23:42:46 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "toolchain: allow side by side
 sysroot directories"
In-Reply-To: <1462543017-42054-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1462543017-42054-1-git-send-email-Vincent.Riera@imgtec.com>
 <1462543017-42054-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160607234246.5a92358d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 6 May 2016 14:56:56 +0100, Vicente Olivert Riera wrote:
> This reverts commit 9a1e9efe2618ebbf12ed2567bcd6e8cca5619547.
> ---
>  toolchain/helpers.mk | 59 ++++++++++++++++------------------------------------
>  1 file changed, 18 insertions(+), 41 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
