From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:44:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/mini-snmpd: fix musl build
In-Reply-To: <20200312190556.1129232-1-fontaine.fabrice@gmail.com>
References: <20200312190556.1129232-1-fontaine.fabrice@gmail.com>
Message-ID: <20200314154438.4c86a776@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 12 Mar 2020 20:05:56 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/6903a0f685076b4a2c2824de6158da40e9e712d8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-linux.c-fix-musl-build.patch         | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/mini-snmpd/0001-linux.c-fix-musl-build.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
