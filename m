From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Sep 2017 13:16:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/linux-firmware: fix typo in
 license info for qla2xxx
In-Reply-To: <20170903104816.1781-1-bernd.kuhls@t-online.de>
References: <20170903104816.1781-1-bernd.kuhls@t-online.de>
Message-ID: <20170903131623.73b51835@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  3 Sep 2017 12:48:16 +0200, Bernd Kuhls wrote:
> https://git.buildroot.net/buildroot/commit/package/linux-firmware?id=91983091455e2b82432509c11f958409e7bbefcd
> added support for ql2xxx adapters with the wrong filename for the
> license file.
> 
> Fixes
> http://autobuild.buildroot.net/results/58a/58a4112eb5ee1a3242ad17dd156f8abc977fb96c/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/linux-firmware/linux-firmware.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
