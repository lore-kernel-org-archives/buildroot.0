From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:17:02 +0100
Subject: [Buildroot] [PATCH v2,2/2] libgdiplus: bump to version 5.6
In-Reply-To: <20180502183336.13568-2-fontaine.fabrice@gmail.com>
References: <20180502183336.13568-1-fontaine.fabrice@gmail.com>
 <20180502183336.13568-2-fontaine.fabrice@gmail.com>
Message-ID: <20181216211702.64a7e47f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 20:33:36 +0200, Fabrice Fontaine wrote:
> Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni and Sergio Prado):
>  - Fix license from MIT to LGPL-2.1 or MPL-1.1 (in a separate patch)

I applied to master. I backported two upstream patches that fix the
license file, so that it is consistent with the comments in the source
code that says the license is MIT. So everything is clear in terms of
licensing now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
