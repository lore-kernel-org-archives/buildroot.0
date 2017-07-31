From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Jul 2017 19:35:40 +0200
Subject: [Buildroot] [PATCH 1/1] apf27: bump to kernel 4.12.4
In-Reply-To: <1501369047-8256-1-git-send-email-tremyfr@gmail.com>
References: <1501369047-8256-1-git-send-email-tremyfr@gmail.com>
Message-ID: <20170731193540.7ee98c40@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Jul 2017 00:57:27 +0200, Philippe Reynes wrote:
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/23508534
> 
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>
> ---
>  .../apf27/{linux-3.18.config => linux-4.12.config} |   12 ++----------
>  configs/armadeus_apf27_defconfig                   |    8 ++++----
>  2 files changed, 6 insertions(+), 14 deletions(-)
>  rename board/armadeus/apf27/{linux-3.18.config => linux-4.12.config} (95%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
