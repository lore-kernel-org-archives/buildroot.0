From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 7 Mar 2019 21:37:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix build on riscv
In-Reply-To: <20190307181026.13713-1-fontaine.fabrice@gmail.com>
References: <20190307181026.13713-1-fontaine.fabrice@gmail.com>
Message-ID: <20190307213700.191dad80@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu,  7 Mar 2019 19:10:26 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/fb95c22cbe1d19e73f0089103ed6da2f4b3081c8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...001-platform-Add-riscv-to-known-platforms.patch | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/flashrom/0001-platform-Add-riscv-to-known-platforms.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
