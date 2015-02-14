From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 22:04:13 +0100
Subject: [Buildroot] [PATCH v2] package/openmvtools: don't use host
 library path
In-Reply-To: <1423914170-10299-1-git-send-email-romain.naour@openwide.fr>
References: <1423914170-10299-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150214220413.04aec452@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Sat, 14 Feb 2015 12:42:50 +0100, Romain Naour wrote:
> Set CUSTOM_PROCPS_LIBS to " " otherwise -L/lib is
> used by default.
> 
> Fixes:
> http://autobuild.buildroot.net/results/bff/bff7d8f3ec19ce790f0c88a336d1007e1ff29836/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  package/openvmtools/openvmtools.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, after fixing the typo in the commit title. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
