From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:50:19 +0200
Subject: [Buildroot] [PATCH 1/1] linux: support uncompressed kernel
In-Reply-To: <20210324114522.285121-1-egorenar@linux.ibm.com>
References: <20210324114522.285121-1-egorenar@linux.ibm.com>
Message-ID: <20210328225019.38dcfda6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 24 Mar 2021 12:45:22 +0100
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Enables to build an uncompressed Linux kernel.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
> ---
>  linux/Config.in | 3 +++
>  linux/linux.mk  | 1 +
>  2 files changed, 4 insertions(+)

I have applied, after making the option conditional on BR2_s390x, as
suggested by Peter. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
