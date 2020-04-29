From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 23:21:00 +0200
Subject: [Buildroot] [PATCH v3, 1/1] package/odhcp6c: bump to version
 f575351cbb3defc0bf52680c9082912a6c264374
In-Reply-To: <20200420163402.1026751-1-fontaine.fabrice@gmail.com>
References: <20200420163402.1026751-1-fontaine.fabrice@gmail.com>
Message-ID: <20200429232100.5e4a665c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 18:34:02 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Switch to official openwrt site instead of sbyx github fork which is not
> up to date anymore. This bump will fix build with musl 1.2.0 thanks to
> https://git.openwrt.org/?p=project/odhcp6c.git;a=commit;h=49305e6847efa43e008d0bebdc176e1833120947
> 
> Also update indentation of hash file (two spaces)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fcd89dd076887e9b590ffa672decf2c84a6d57f8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Baruch Siach):
>  - Use https transport

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
