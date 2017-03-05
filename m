From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:51:37 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
Message-ID: <20170305215137.1600833e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 16:52:48 +0100, Romain Naour wrote:

> PHYSFS_LICENSE = zlib license (physfs), LGPLv2.1+ (lzma)

This is not completely correct. Read src/lzma/lzma.txt for details (and
include it in the license files). The lzma SDK is available under the
following licenses:

1) GNU Lesser General Public License (GNU LGPL)
2) Common Public License (CPL)
3) Simplified license for unmodified code (read SPECIAL EXCEPTION) 
4) Proprietary license 

So perhaps:

zlib license (physfs), LGPv2.1+ or CPL or special license (lzma)

 ?

Could you respin after double checking this?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
