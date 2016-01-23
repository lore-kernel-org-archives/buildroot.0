From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 13:09:43 +0100
Subject: [Buildroot] [PATCH 1/4] package/sqlite: Disable autoreconf
In-Reply-To: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
References: <1453544625-30597-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160123130943.43938e06@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 23 Jan 2016 11:23:42 +0100, Bernd Kuhls wrote:
> Currently we have no patches for this package, compilation works without
> autoreconf.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/sqlite/sqlite.mk | 3 ---
>  1 file changed, 3 deletions(-)

Patches 1-3 applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
