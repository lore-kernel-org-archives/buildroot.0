From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 7 Sep 2018 09:13:18 +0200
Subject: [Buildroot] [PATCH 1/1] python-numpy: bump to version 1.15.1
In-Reply-To: <20180906223744.3635-1-joseph.kogut@gmail.com>
References: <20180906223744.3635-1-joseph.kogut@gmail.com>
Message-ID: <20180907091318.2d205c05@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Sep 2018 15:37:44 -0700, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Is this update also fixing the build with Python 3.7.0, i.e fixing:

  http://autobuild.buildroot.net/results/d59/d5929c1c48a65575019c39f9ee0ed84a9ef621c3/build-end.log

> ---
> Patch 0002-Add-support-of-ARC.patch was merged [1] upstream.
>  
> [1] https://github.com/numpy/numpy/commit/8edd610ffa3499eea3580f98f296ec80578fba73

This sort of note should be inside the commit log, i.e not after the
"---" separator.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
