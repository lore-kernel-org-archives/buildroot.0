From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:37:49 +0100
Subject: [Buildroot] [PATCH v3 1/2] package/physfs: new package
In-Reply-To: <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
References: <20170301225611.11494-1-romain.naour@gmail.com>
 <4328635a-2687-59f6-a192-4af579aafb58@gmail.com>
 <20170305215137.1600833e@free-electrons.com>
 <755ee979-57de-4718-9fa0-5f7de1f05289@gmail.com>
Message-ID: <20170305223749.3567d0af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Mar 2017 22:14:02 +0100, Romain Naour wrote:
> > zlib license (physfs), LGPv2.1+ or CPL or special license (lzma)
> > 
> >  ?  
> 
> It seems some files are under public domain when the special license is used.
> 
> SPECIAL EXCEPTION #3: Igor Pavlov, as the author of this code, expressly permits
> you to use code of the following files:
> BranchTypes.h, LzmaTypes.h, LzmaTest.c, LzmaStateTest.c, LzmaAlone.cpp,
> LzmaAlone.cs, LzmaAlone.java
> as public domain code.
> 
> Maybe "special license" is enough ?

My understanding of lzma.txt is that you really have the choice between
those different licensing options, so I believe encoding all of them in
<pkg>_LICENSE is probably better.

Cc'ing Arnout and Yann to get their insight.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
