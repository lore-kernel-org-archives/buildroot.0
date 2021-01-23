From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:58:11 +0100
Subject: [Buildroot] [PATCH 1/1] package/nvme: add systemd optional
 dependency
In-Reply-To: <20210120201622.179090-1-fontaine.fabrice@gmail.com>
References: <20210120201622.179090-1-fontaine.fabrice@gmail.com>
Message-ID: <20210123215811.3a497226@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Jan 2021 21:16:22 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> systemd is an optional dependency (enabled by default) since version
> 1.10 and
> https://github.com/linux-nvme/nvme-cli/commit/48c10dbfaf00777170e209db20f7d07e47f7a983
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/8d14a5702aa1ffe3f036d1e1505e9596e3d4d466
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/nvme/nvme.mk | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
