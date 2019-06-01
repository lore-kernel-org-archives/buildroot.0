From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Jun 2019 15:08:26 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/python-matplotlib: depends
 on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
In-Reply-To: <20190526155223.26168-1-fontaine.fabrice@gmail.com>
References: <20190526155223.26168-1-fontaine.fabrice@gmail.com>
Message-ID: <20190601150826.1f3a0840@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 26 May 2019 17:52:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/038d50784ec80b35e3daff1966df07a1b52780b3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-matplotlib/Config.in | 1 +
>  1 file changed, 1 insertion(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
