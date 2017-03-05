From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 12:10:48 +0100
Subject: [Buildroot] [PATCH 1/1] package/chrony: bump version to 3.1
In-Reply-To: <20170305094852.20985-1-bernd.kuhls@t-online.de>
References: <20170305094852.20985-1-bernd.kuhls@t-online.de>
Message-ID: <20170305121048.641249d9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 10:48:52 +0100, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/chrony/chrony.hash | 6 +++---
>  package/chrony/chrony.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks. However, it's nice to send version bumps,
but could you also look at the build failures caused by packages you
regularly bump/maintain? I'm thinking of mplayer and libcec for example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
