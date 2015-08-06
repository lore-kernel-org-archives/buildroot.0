From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:10:01 +0200
Subject: [Buildroot] [PATCH] fs/common: add <fs>_POST_GEN_HOOKS support
In-Reply-To: <1438331000-26534-1-git-send-email-nrubinstein@aldebaran.com>
References: <1438331000-26534-1-git-send-email-nrubinstein@aldebaran.com>
Message-ID: <20150806091001.5d609ce2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear No? Rubinstein,

On Fri, 31 Jul 2015 10:23:20 +0200, No? Rubinstein wrote:
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> 
> The common filesystem infrastructure already supports a
> <fs>_PRE_GEN_HOOKS variable, which allows filesystem makefiles to
> register some actions to be done before the root filesystem image is
> generated.
> 
> This commit adds a similiar <fs>_POST_GEN_HOOKS variable, which will
> allow filesystem makefiles to do some actions after the filesystem
> image has been generated. It will initially be used by the iso9660
> filesystem to delete the temporary directory it creates.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
> ---
> Re-sending this patch to fix hybrid ISO generation as added by patch 
> 5bac06e8810eb86e7bddc771fda68f0c59a3c3fa.

Thanks, but could you submit a single patch series that does both the
addition of POST_GEN_HOOKS (this patch) and the change to iso9660.mk to
use POST_GEN_HOOKS to fix the hybrid image problem?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
