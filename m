From: Andreas Naumann <dev@andin.de>
Date: Fri, 07 Feb 2014 09:51:41 +0100
Subject: [Buildroot]  build speedup possible?
Message-ID: <52F49E9D.2020506@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi guys,

First of all kudos again for this very good tool! I'm using it almsot 
daily and am stoked about the functionality but simple usage at the same 
time.
Now one issue with build systems is always build time. It seems the 
speed is not impacted much by just spending more horsepower (cpu cores). 
When looking at the load I see very frequently that just one core is 
busy with one package, especially during the configure step. Some 
packages themselves are build with just one core, I guess we cant do 
very much about that.
However, why are independent packages not build in parallel? Are the 
dependencies too complex to make this work? Thanks for any insight!


cheers,
Andreas
