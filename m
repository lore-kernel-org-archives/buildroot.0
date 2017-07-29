From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 22:24:45 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: bump version to 1.27.1
In-Reply-To: <20170728161808.15607-1-aduskett@gmail.com>
References: <20170728161808.15607-1-aduskett@gmail.com>
Message-ID: <20170729222445.6705403a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 28 Jul 2017 12:18:08 -0400, Adam Duskett wrote:
> In addition, update busybox-minimal.config and busybox.config by loading the
> config files and saving them back.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/busybox/busybox-minimal.config | 176 ++++++++++++++++++++-------------
>  package/busybox/busybox.config         | 174 +++++++++++++++++++-------------
>  package/busybox/busybox.hash           |   6 +-
>  package/busybox/busybox.mk             |   2 +-
>  4 files changed, 217 insertions(+), 141 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
