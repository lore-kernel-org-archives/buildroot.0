From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 23:38:03 +0200
Subject: [Buildroot] [PATCH v2 3/3] package/glibc: allow to specify
 host-make
In-Reply-To: <20180903191933.26080-3-romain.naour@gmail.com>
References: <20180903191933.26080-1-romain.naour@gmail.com>
 <20180903191933.26080-3-romain.naour@gmail.com>
Message-ID: <20180908233803.1d7f81c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Sep 2018 21:19:33 +0200, Romain Naour wrote:
> Use host-make package if GNU make from the host machine is too old.
> 
> Use the newly introduced BR2_MAKE_HOST_DEPENDENCY and BR2_MAKE to
> provide respectively, host-make dependency and the path to the GNU
> make binary to use for building glibc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/576/5760ea2635d9aecc9c789494a8b2cc73a1af1ceb
> http://autobuild.buildroot.net/results/583/58347b94884eee2db28740486eda280e8c08e22f
> http://autobuild.buildroot.net/results/dc7/dc7c8cd548409864ab0055e196c0280457a5fb5f
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/glibc/glibc.mk | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
