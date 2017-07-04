From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 08:51:22 +0200
Subject: [Buildroot] [PATCH v3 06/11] package/mke2img: add option to
 specify block size
In-Reply-To: <20170703225106.1492-7-s.martin49@gmail.com>
References: <20170703225106.1492-1-s.martin49@gmail.com>
 <20170703225106.1492-7-s.martin49@gmail.com>
Message-ID: <20170704085122.269ecea0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 00:51:01 +0200, Samuel Martin wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ext filesystems can use a block size of 1024, 2048, or 4096 bytes, the
> former being interesting to store small files, while the latter being
> more intersting to store bigger files.
> 
> So far, we were using the defualt, which was to use a 1024-byte block.

defualt -> default

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
