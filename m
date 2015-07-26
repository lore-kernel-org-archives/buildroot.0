From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Jul 2015 19:36:19 +0200
Subject: [Buildroot] [PATCH] package/dropbear: Fix symlink only if
 pointing to the right directory
In-Reply-To: <1436954103-8380-1-git-send-email-paul@crapouillou.net>
References: <1436954103-8380-1-git-send-email-paul@crapouillou.net>
Message-ID: <20150726193619.13297f6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul,

On Wed, 15 Jul 2015 11:55:03 +0200, paul at crapouillou.net wrote:
> From: Paul Cercueil <paul@crapouillou.net>
> 
> This commit ensures that the /etc/dropbear symlink won't be removed if
> it points elsewhere than /var/run/dropbear.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/dropbear/S50dropbear      | 4 ++--
>  package/dropbear/dropbear.service | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Following the comments from Yann E. Morin, I've marked your patch as
Changes Requested. Can you respin a new version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
