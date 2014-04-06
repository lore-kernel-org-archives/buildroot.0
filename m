From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Apr 2014 15:26:10 +0200
Subject: [Buildroot] [PATCH 07/11] fmtools: Switch to 2.x series
In-Reply-To: <1396558881-29631-7-git-send-email-paul@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-7-git-send-email-paul@crapouillou.net>
Message-ID: <20140406152610.6406edc4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Thu,  3 Apr 2014 23:01:17 +0200, Paul Cercueil wrote:
> From: Maarten ter Huurne <maarten@treewalker.org>
> 
> Specifically, bump version to 2.0.1.
> The 2.x series uses the V4L2 API instead of V4L.
> 
> Signed-Off-By: Maarten ter Huurne <maarten@treewalker.org>
> Acked-By: Paul Cercueil <paul@crapouillou.net>
> ---
>  package/fmtools/Config.in  |  4 ++--
>  package/fmtools/fmtools.mk | 15 +++------------
>  2 files changed, 5 insertions(+), 14 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
