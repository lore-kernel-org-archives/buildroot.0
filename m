From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 07:19:24 +0200
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
In-Reply-To: <20160922034142.itfvvgp56mdxcslu@tarshish>
References: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160921155729.1c4332b7@free-electrons.com>
 <20160921164753.j56sstaxx7jy4j66@tarshish>
 <20160921200430.74f46a81@free-electrons.com>
 <8760pprm82.fsf@dell.be.48ers.dk>
 <20160922034142.itfvvgp56mdxcslu@tarshish>
Message-ID: <20160922071924.7a92d39b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 06:41:42 +0300, Baruch Siach wrote:

> > Either that or I update DEVELOPERS when I also update CHANGES, but not
> > everyone might want to get listed / might want to get listed without
> > being the author of the commit adding the package.  
> 
> A DEVELOPERS entry is probably most useful when the package is first added, as 
> it starts showing up in the autobuilder. Delaying the DEVELOPERS update 
> reduces its usefulness.

Exactly my thought: I want the DEVELOPERS file to be updated at the
same time as a package is added, so that as soon there are autobuilder
failures, they are directly reported to the person who contributed the
package. That's one of the big points for having this DEVELOPERS file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
