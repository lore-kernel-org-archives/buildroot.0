From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 00:47:04 +0200
Subject: [Buildroot] [PATCH 1/1] protobuf: version bump to 3.3.0
In-Reply-To: <20170626141035.28299-1-aduskett@codeblue.com>
References: <20170626141035.28299-1-aduskett@codeblue.com>
Message-ID: <20170702004704.11139c35@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Jun 2017 10:10:35 -0400, Adam Duskett wrote:
> Also remove 416f90939d4de58fe1a4e2489120010313183291.patch as it is
> part of 3.3.0.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
>  package/protobuf/protobuf.hash | 3 +--
>  package/protobuf/protobuf.mk   | 4 +---
>  2 files changed, 2 insertions(+), 5 deletions(-)

This patch is wrong because it forgets to update the hash in
package/python-protobuf/python-protobuf.hash. In addition, there is
already a patch upgrading protobuf (correctly) in
https://patchwork.ozlabs.org/patch/761466/.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
