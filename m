From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Apr 2015 09:11:53 +0200
Subject: [Buildroot] [PATCH 1/1] heimdal: needs host-flex and explicitly
 set -lpthread
In-Reply-To: <5535AFDE.9060704@gmail.com>
References: <1429466003-4595-1-git-send-email-bluemrp9@gmail.com>
 <20150420223532.5677fb5f@free-electrons.com>
 <5535AFDE.9060704@gmail.com>
Message-ID: <20150421091153.54b44a73@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Mon, 20 Apr 2015 19:03:10 -0700, Ryan Coe wrote:

> I found the addition of host-flex not to be necessary.  The -lpthread 
> addition fixes a build error on my machine.  I will submit a new version 
> of my patch.

Could you give the full build log of host-heimdal on your machine, as
well as the contents of config.log, when the build fails due to
-lpthread being missing?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
