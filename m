From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Jun 2014 16:33:26 +0200
Subject: [Buildroot] [PATCH 2/2] systemd: add SMACK support option.
In-Reply-To: <1398020044-21021-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1398020044-21021-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1398020044-21021-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20140608163326.669c44b2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Sun, 20 Apr 2014 20:54:04 +0200, Eric Le Bihan wrote:
> A new configuration option is available in systemd menu, to enable
> support for SMACK.
> 
> For this feature to properly work, systemd requires attr (build
> dependency, also used for other features) and smack (runtime dependency).
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  package/systemd/Config.in  | 14 ++++++++++++++
>  package/systemd/systemd.mk | 13 +++++++++++++
>  2 files changed, 27 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
