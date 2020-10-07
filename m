From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Oct 2020 21:29:02 +0200
Subject: [Buildroot] [PATCH 2/2] defconfigs: use
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_
In-Reply-To: <20201007132052.29560-2-matthew.weber@rockwellcollins.com>
References: <20201007132052.29560-1-matthew.weber@rockwellcollins.com>
 <20201007132052.29560-2-matthew.weber@rockwellcollins.com>
Message-ID: <a74f404b-fbc2-7c88-bbcc-e8094f67bda5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/10/2020 15:20, Matt Weber wrote:
> For defconfigs that create a boot envimage, add the host package
> uboot-tools and update the script variable names.
> 
> Related to 78559d699ae4b5c22ae77cfb7994560e0267be96
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

 Applied with a similar change as in patch 1, thanks.

 Regards,
 Arnout
