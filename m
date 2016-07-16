From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jul 2016 21:03:31 +0200
Subject: [Buildroot] [PATCH] package/autofs: requires NPTL
In-Reply-To: <1468681059-20867-1-git-send-email-romain.naour@gmail.com>
References: <1468681059-20867-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160716210331.51b4912a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Jul 2016 16:57:39 +0200, Romain Naour wrote:
> autofs uses pthread_condattr_setclock() which is available only with
> toolchains with NPTL threads support.
> 
> Fixes:
> http://autobuild.buildroot.net/results/152/152d917b0078aeb3715cd562cdecf7d0debf924b
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/autofs/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
