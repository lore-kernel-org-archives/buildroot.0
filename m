From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Jul 2018 23:00:33 +0200
Subject: [Buildroot] [PATCH 1/1] ncmpc: bump to version 0.30
In-Reply-To: <20180723174345.29552-1-fontaine.fabrice@gmail.com>
References: <20180723174345.29552-1-fontaine.fabrice@gmail.com>
Message-ID: <20180725230033.44e17093@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 Jul 2018 19:43:45 +0200, Fabrice Fontaine wrote:
> Since this version, ncmpc depends on C++14:
> https://github.com/MusicPlayerDaemon/ncmpc/commit/aea91692b05e7c2cd2e1b09cf10b0196e3527807
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ncmpc/Config.in  | 7 +++++--
>  package/ncmpc/ncmpc.hash | 2 +-
>  package/ncmpc/ncmpc.mk   | 2 +-
>  3 files changed, 7 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
