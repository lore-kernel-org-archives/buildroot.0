From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 17:58:49 +0200
Subject: [Buildroot] [PATCH] diffutils: bump to version 3.5
In-Reply-To: <1471958867-6960-1-git-send-email-gustavo@zacarias.com.ar>
References: <1471958867-6960-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160823175849.67ef99d0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 23 Aug 2016 10:27:47 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/diffutils/diffutils.hash | 2 +-
>  package/diffutils/diffutils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

It doesn't apply on next, since we already bumped to 3.4. I've fixed up
the conflict, but it would be useful if your patches aimed at the next
branch would be based on the current next branch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
