From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Aug 2020 00:01:25 +0200
Subject: [Buildroot] [PATCH 1/1] package/c-periphery: fix build with
 kernel 4.6 and 4.7
In-Reply-To: <20200820185616.800142-1-fontaine.fabrice@gmail.com>
References: <20200820185616.800142-1-fontaine.fabrice@gmail.com>
Message-ID: <20200821000125.4ce16bd7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Aug 2020 20:56:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/c3b868c12baac9438b792ada105c0b0de0106311
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...01-CMakeLists.txt-fix-gpio-detection.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/c-periphery/0001-CMakeLists.txt-fix-gpio-detection.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
