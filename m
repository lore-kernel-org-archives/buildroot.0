From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jan 2018 22:57:44 +0100
Subject: [Buildroot] [PATCH 1/1] php: bump to 7.2.1
In-Reply-To: <20180129165326.18962-1-Adamduskett@outlook.com>
References: <20180129165326.18962-1-Adamduskett@outlook.com>
Message-ID: <20180130225744.7f18a816@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Jan 2018 11:53:26 -0500, Adam Duskett wrote:
> Also update 0003-configure-disable-the-phar-tool.patch as configure.in is no
> longer provided in the tarballs. Instead, configure.ac is patched.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
>  package/php/0003-configure-disable-the-phar-tool.patch | 16 +++++++++-------
>  package/php/php.hash                                   |  2 +-
>  package/php/php.mk                                     |  2 +-
>  3 files changed, 11 insertions(+), 9 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
