From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Apr 2015 11:09:59 +0200
Subject: [Buildroot] [PATCH v2 1/3] uboot: add support for patch files
 and URLs
In-Reply-To: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
References: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150419110959.1acb81e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Sat, 18 Apr 2015 16:27:42 -0400, Frank Hunleth wrote:
> The existing u-boot patch option only allowed directories to be
> specified. This adds support for URLs using similar code as found
> in linux/linux.mk. Local files are also handled now.
> 
> This change is useful for Intel Edison support, so that Intel's u-boot
> patch can be downloaded rather than stored in the Buildroot source tree.
> 
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - Switch to linux.mk approach to patches (suggested by Thomas Petazzoni)

All three patches applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
