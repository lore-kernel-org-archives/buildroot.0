From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:02:39 +0200
Subject: [Buildroot] [PATCH] irssi: fix attributes ordering in Config.in
In-Reply-To: <20170412142355.4538-1-rprebello@gmail.com>
References: <20170412142355.4538-1-rprebello@gmail.com>
Message-ID: <20170412210239.2e803233@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 11:23:55 -0300, Rodrigo Rebello wrote:
> According to the Buildroot convention, 'depends on' attributes shall
> come before 'select' ones in Kconfig files.
> 
> Detected by check-package.
> 
> Signed-off-by: Rodrigo Rebello <rprebello@gmail.com>
> ---
>  package/irssi/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
