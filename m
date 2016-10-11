From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 11 Oct 2016 11:22:36 +0200
Subject: [Buildroot] [PATCH 1/3] Revert "Revert "libglib2: bump to
 version 2.50.0""
In-Reply-To: <1476135549-32056-1-git-send-email-gustavo@zacarias.com.ar>
References: <1476135549-32056-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20161011112236.2047f175@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Oct 2016 18:39:07 -0300, Gustavo Zacarias wrote:
> This reverts commit 40da5b434d0d25662b447f14b724245da04ed90d.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libglib2/Config.in     | 2 ++
>  package/libglib2/libglib2.hash | 4 ++--
>  package/libglib2/libglib2.mk   | 6 +++---
>  3 files changed, 7 insertions(+), 5 deletions(-)

Thanks a lot, all three patches applied!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
