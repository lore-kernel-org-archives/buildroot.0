From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:52:06 +0100
Subject: [Buildroot] [PATCH] package/sslh: fix a patch, drop the other
In-Reply-To: <1487886188-29023-1-git-send-email-yann.morin.1998@free.fr>
References: <1487886188-29023-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170223225206.05bfc774@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 22:43:08 +0100, Yann E. MORIN wrote:
> It turned out that the troll character U+c2a0 was added by our own
> patch.
> 
> So fix it amd drop our second patch.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  ...ecure-version-while-building-sslh-in-a-larger-git-t.patch |  4 +++-
>  package/sslh/0002-replace-U+c2a0.patch                       | 12 ------------
>  2 files changed, 3 insertions(+), 13 deletions(-)
>  delete mode 100644 package/sslh/0002-replace-U+c2a0.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
