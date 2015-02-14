From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:12:37 +0100
Subject: [Buildroot] [PATCH] lmbench: use pkg-config to find libtirpc
In-Reply-To: <1423414532-31769-1-git-send-email-fabio.porcedda@gmail.com>
References: <1423414532-31769-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150214221237.15592cf5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Sun,  8 Feb 2015 17:55:32 +0100, Fabio Porcedda wrote:
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/lmbench/lmbench.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to next, thanks. I applied to next, since there was no
indication that this commit was fixing a particular bug.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
