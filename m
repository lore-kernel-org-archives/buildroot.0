From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 22 Sep 2016 07:16:06 +0200
Subject: [Buildroot] [PATCH 1/1] shapelib: new package
In-Reply-To: <20160922034142.itfvvgp56mdxcslu@tarshish> (Baruch Siach's
 message of "Thu, 22 Sep 2016 06:41:42 +0300")
References: <1469969150-3029-1-git-send-email-mr.zoltan.gyarmati@gmail.com>
 <20160921155729.1c4332b7@free-electrons.com>
 <20160921164753.j56sstaxx7jy4j66@tarshish>
 <20160921200430.74f46a81@free-electrons.com>
 <8760pprm82.fsf@dell.be.48ers.dk>
 <20160922034142.itfvvgp56mdxcslu@tarshish>
Message-ID: <87bmzgqzu1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Either that or I update DEVELOPERS when I also update CHANGES, but not
 >> everyone might want to get listed / might want to get listed without
 >> being the author of the commit adding the package.

 > A DEVELOPERS entry is probably most useful when the package is first added, as 
 > it starts showing up in the autobuilder. Delaying the DEVELOPERS update 
 > reduces its usefulness.

Correct. I don't think the additional trivial commits to adjust
DEVELOPERS are really an issue, so lets just ask people to send a 2nd
patch to update the file whenever new packages (or families of packages)
are added.

-- 
Venlig hilsen,
Peter Korsgaard 
