From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Feb 2014 09:03:53 +0100
Subject: [Buildroot] [PATCH v3 4/4] beaglebone: change to zImage
In-Reply-To: <046952e3-d76e-400b-916b-a8fbd069a03b@email.android.com>
References: <1391717684-4244-1-git-send-email-anders@chargestorm.se>
 <1391717684-4244-5-git-send-email-anders@chargestorm.se>
 <CALq67GBCrOGh_yxzjqcVXtUzoox=AEJaYJL27_UObB8qVMNyow@mail.gmail.com>
 <046952e3-d76e-400b-916b-a8fbd069a03b@email.android.com>
Message-ID: <20140207090353.384bd1f4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anders Darander,

On Fri, 7 Feb 2014 06:59:57 +0100, Anders Darander wrote:

> What do other dev's think about this? It doesn't really matter to me if I squash then or not. 
> 
> My reasoning was that of you kept the old U-Boot environment, the new U-Boot works with a uImage. That's basically why I kept it as separate patches. 

Hum, I believe that's a good point. Then maybe for "clarity" it's
better to keep them separate. This way, an user looking through the
changes on the beaglebone_defconfig will more likely see this change.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
