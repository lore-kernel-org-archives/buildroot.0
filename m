From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 5 Mar 2017 22:14:02 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <20170305215137.1600833e@free-electrons.com>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
 <20170305215137.1600833e@free-electrons.com>
Message-ID: <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 05/03/2017 ? 21:51, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Sun, 5 Mar 2017 16:52:48 +0100, Romain Naour wrote:
> 
>> PHYSFS_LICENSE = zlib license (physfs), LGPLv2.1+ (lzma)
> 
> This is not completely correct. Read src/lzma/lzma.txt for details (and
> include it in the license files). The lzma SDK is available under the
> following licenses:
> 
> 1) GNU Lesser General Public License (GNU LGPL)
> 2) Common Public License (CPL)
> 3) Simplified license for unmodified code (read SPECIAL EXCEPTION) 
> 4) Proprietary license 
> 
> So perhaps:
> 
> zlib license (physfs), LGPv2.1+ or CPL or special license (lzma)
> 
>  ?

It seems some files are under public domain when the special license is used.

SPECIAL EXCEPTION #3: Igor Pavlov, as the author of this code, expressly permits
you to use code of the following files:
BranchTypes.h, LzmaTypes.h, LzmaTest.c, LzmaStateTest.c, LzmaAlone.cpp,
LzmaAlone.cs, LzmaAlone.java
as public domain code.

Maybe "special license" is enough ?

Best regards,
Romain

> 
> Could you respin after double checking this?
> 
> Thanks,
> 
> Thomas
> 
