From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:14:05 +0100
Subject: [Buildroot] [PATCH] package/kodi: fix leftover instance of
 'xbmc'
In-Reply-To: <1419779142-22229-1-git-send-email-yann.morin.1998@free.fr>
References: <1419779142-22229-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20141228221405.04b7e0c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Dec 2014 16:05:42 +0100, Yann E. MORIN wrote:
> During the XBMC -> Kodi rename, some instance of 'xbmc' were left out,
> which meant our startup script would not run Kodi, and that Kodi would
> create its /.kodi directory.
> 
> This patch renames the missing bits.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/kodi/S50kodi |  2 +-
>  package/kodi/kodi.mk | 20 +++++++++++---------
>  2 files changed, 12 insertions(+), 10 deletions(-)

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
