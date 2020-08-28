From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 23:57:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/bluez-tools: fix build with gcc
 10
In-Reply-To: <20200826213134.408126-1-fontaine.fabrice@gmail.com>
References: <20200826213134.408126-1-fontaine.fabrice@gmail.com>
Message-ID: <20200828235740.4431eb25@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 26 Aug 2020 23:31:34 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/2641cea0483c5f6b65ece8016d546ee9bea0d7d1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../bluez-tools/0001-fix-gcc-10-compile.patch | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 package/bluez-tools/0001-fix-gcc-10-compile.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
