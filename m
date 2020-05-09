From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 9 May 2020 13:43:07 +0200
Subject: [Buildroot] [PATCH 5/5] package/systemd: add support for
 apparmor
In-Reply-To: <20200508015956.3270405-5-aduskett@gmail.com>
References: <20200508015956.3270405-1-aduskett@gmail.com>
 <20200508015956.3270405-5-aduskett@gmail.com>
Message-ID: <20200509134307.76fcb264@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 May 2020 18:59:56 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> If libapparmor is selected, depend on libapparmor and set -Dapparmor=true
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/systemd/systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
