From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Jan 2019 18:04:18 +0100
Subject: [Buildroot] [PATCH 1/1] php-ssh2: fix build with php 7.3.0
In-Reply-To: <20190110163852.8631-1-fontaine.fabrice@gmail.com>
References: <20190110163852.8631-1-fontaine.fabrice@gmail.com>
Message-ID: <20190112180418.7e2993f3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 10 Jan 2019 17:38:52 +0100, Fabrice Fontaine wrote:
> Retrieve upstream patches to fix build with php 7.3.0
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/e3b2a72e1f7f776c30a52bb98bb47c04d0b4919b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-fix-php_url-fields-usage-for-PHP-7-3.patch | 302 +++++++++
>  ...ort-Restored-commented-reference-counting.patch | 746 +++++++++++++++++++++
>  2 files changed, 1048 insertions(+)
>  create mode 100644 package/php-ssh2/0001-fix-php_url-fields-usage-for-PHP-7-3.patch
>  create mode 100644 package/php-ssh2/0002-dstogov-Fixed-PHP7-port-Restored-commented-reference-counting.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
