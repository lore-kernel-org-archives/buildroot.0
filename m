From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Oct 2020 23:39:26 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
References: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
 <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
Message-ID: <aae92521-2c14-ff28-b092-6f3e89ae2b50@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/09/2020 21:29, Matt Weber wrote:
> Migrating the support for this feature to uboot-tools to gain the
> ability to build env files when BR2_TARGET_UBOOT isn't selected.
> 
> Note: This patch creates a circular dependency with uboot until the
> similar migration patch is merged for uboot scripts
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 Series applied with the changes as explained in my reply to patch 1, and a few
additional changes. Please have a got with current master to check if I broke
anything.

 Regards,
 Arnout
