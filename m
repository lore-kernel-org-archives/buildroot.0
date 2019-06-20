From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Jun 2019 18:14:08 +0200
Subject: [Buildroot] [PATCH 21/27] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_90620
In-Reply-To: <20190614210346.121013-22-giulio.benetti@micronovasrl.com>
References: <20190614210346.121013-1-giulio.benetti@micronovasrl.com>
 <20190614210346.121013-22-giulio.benetti@micronovasrl.com>
Message-ID: <20190620181408.308b4443@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jun 2019 23:03:40 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> GCC fails on building haproxy for the Microblaze Arch:
> http://autobuild.buildroot.org/results/64706f96db793777de9d3ec63b0a47d776cf33fd/build-end.log
> 
> Originally reported for gpsd:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=90620
> 
> Fixed on Gcc 8.x but regressed in Gcc 9.x.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  toolchain/Config.in | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
