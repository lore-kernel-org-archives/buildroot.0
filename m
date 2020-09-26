From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Sep 2020 15:40:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/ser2net: fix build on musl
In-Reply-To: <20200926104548.287620-1-fontaine.fabrice@gmail.com>
References: <20200926104548.287620-1-fontaine.fabrice@gmail.com>
Message-ID: <20200926154009.4a38ddb7@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 26 Sep 2020 12:45:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build on musl fails since version 4.2.2 and
> https://github.com/cminyard/ser2net/commit/1703ddf5231caf08c7bb2c14a845bc2dd602159f
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4c0b238186cb2fb2d81807ce006945594f92b2cd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-port.h-include-sys-time.h.patch      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 package/ser2net/0001-port.h-include-sys-time.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
