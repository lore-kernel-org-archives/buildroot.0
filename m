From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 18:22:21 +0100
Subject: [Buildroot] [PATCH 1/2] fs/iso9660: add option for transparent
 (de)compression
In-Reply-To: <8590724ca7fd08819699645bbc05e7175196e2d2.1513805241.git.yann.morin.1998@free.fr>
References: <cover.1513805241.git.yann.morin.1998@free.fr>
 <8590724ca7fd08819699645bbc05e7175196e2d2.1513805241.git.yann.morin.1998@free.fr>
Message-ID: <20171231182221.0139510f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Dec 2017 22:27:42 +0100, Yann E. MORIN wrote:

> +config BR2_TARGET_ROOTFS_ISO9660_TRANSP_COMPRESS

I found the abbreviation to TRANSP_COMPRESS a little bit useless, so
I've changed the name of the option to _TRANSPARENT_COMPRESSION
instead. Applied with this change. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
