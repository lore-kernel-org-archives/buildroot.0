From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 May 2008 14:24:46 +0200
Subject: [Buildroot] Buildroot with java compiler and libgcj problem
 (arm iwmmxt EABI softfp)
In-Reply-To: <FBCMMO02kzr0FNacww50004c0c6@FBCMMO02.fbc.local>
References: <FBCMMO02kzr0FNacww50004c0c6@FBCMMO02.fbc.local>
Message-ID: <20080515142446.67bff2e1@crazy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 3 Apr 2008 20:44:36 +0200,
<ffileppo@alice.it> a ?crit :

> I'm trying to compile buildroot with java compiler and libgcj for
> arm-iwmmxt-eabi with software floating point.
> 
> I get this error (see below) -- Without java compiler and libgcj
> buildroot is able to complete the compilation.

Same problem here, reproducible with today's Subversion.
A bug has been opened (http://busybox.net/bugs/view.php?id=2864), but
no activity so far.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 189 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080515/7f24c450/attachment.pgp 
