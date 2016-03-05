From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Mar 2016 19:12:36 +0100
Subject: [Buildroot] [PATCH 1/3] package: remove _gp issue workaround
 for Codesourcery nios2 toolchain
In-Reply-To: <1457193861-23828-1-git-send-email-romain.naour@gmail.com>
References: <1457193861-23828-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160305191236.60c8656e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat,  5 Mar 2016 17:04:19 +0100, Romain Naour wrote:
> The _gp link issue has been fixed in CS nios2 2015.11.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> All package has been build tested with this toolchain.
> ---
>  package/aiccu/Config.in         | 3 ---
>  package/crda/Config.in          | 3 ---
>  package/cryptsetup/Config.in    | 3 ---
>  package/dmraid/Config.in        | 4 ----
>  package/janus-gateway/Config.in | 2 --
>  package/libmicrohttpd/Config.in | 3 ---
>  package/libssh2/Config.in       | 2 --
>  package/libupnpp/Config.in      | 3 ---
>  package/mesa3d/Config.in        | 3 ---
>  package/mosquitto/Config.in     | 3 ---
>  package/php-ssh2/Config.in      | 2 --
>  package/upmpdcli/Config.in      | 3 ---
>  12 files changed, 34 deletions(-)

All three patches applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
