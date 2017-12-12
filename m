From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Dec 2017 11:41:27 +0100
Subject: [Buildroot] [PATCH] package/linux-tools: fixes build of iio
 with 4.14+ kernels
In-Reply-To: <8efd7427-9096-bf58-0945-09e9fa3847a4@free.fr>
References: <1512733938-29854-1-git-send-email-julien.boibessot@free.fr>
 <20171212073004.6f6d72e3@windsurf.png.is.keysight.com>
 <8efd7427-9096-bf58-0945-09e9fa3847a4@free.fr>
Message-ID: <20171212114127.7969504d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 10:35:24 +0100, Julien Boibessot wrote:

> > Applied to master after improving the commit log. Thanks!  
> 
> Thanks Thomas, should I send the same for 2017.02 ?

Not needed, Peter will apply it to the 2017.02.x branch.

Ideally, when you know a patch is needed for 2017.02.x, it would be
nice to indicate that under the --- sign that follows the
Signed-off-by. This way, it is clear for Peter that the submitter wants
the patch in 2017.02.x.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
