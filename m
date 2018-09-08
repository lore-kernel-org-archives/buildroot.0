From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 8 Sep 2018 21:48:47 +0200
Subject: [Buildroot] [PATCH 1/1] libminiupnpc: fix hash for license file
In-Reply-To: <CALFsTFWp749gJPo4U-fODmquKzdwQtd=CM8d7MishAWLSsy2Tw@mail.gmail.com>
References: <20180908175903.4561-1-asafka7@gmail.com>
 <20180908213601.5d7a0dfb@windsurf.home>
 <CALFsTFWp749gJPo4U-fODmquKzdwQtd=CM8d7MishAWLSsy2Tw@mail.gmail.com>
Message-ID: <20180908214847.27eb3a59@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 8 Sep 2018 22:43:12 +0300, Asaf Kahlon wrote:

> They just replaced the year 2015 with 2016...

This should be mentioned in the commit log, so that we know that
someone has verified what the changes were. That's the whole point of
having hashes for license files: detecting when the license file
contents are changed. So if we just blindly update the hash, it
completely defeats the purpose of having those hashes.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
