From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Jul 2016 09:53:54 +0200
Subject: [Buildroot] [PATCH] package/swupdate: bump to version 2016.07
In-Reply-To: <20160715061654.20289-1-joerg.krause@embedded.rocks>
References: <20160715061654.20289-1-joerg.krause@embedded.rocks>
Message-ID: <20160715095354.700aebaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 15 Jul 2016 08:16:54 +0200, J?rg Krause wrote:
> * Remove fetching upstream patch to fix build without MTD support
> * Update .config
> * Update help text as SSL support is now needed for other features
>   than the webserver too
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
>  package/swupdate/Config.in       |  3 +--
>  package/swupdate/swupdate.config | 43 ++++++++++------------------------------
>  package/swupdate/swupdate.hash   |  3 +--
>  package/swupdate/swupdate.mk     |  5 +----
>  4 files changed, 13 insertions(+), 41 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
