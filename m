From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 14:13:42 +0100
Subject: [Buildroot] [PATCH 1/3] configs: add defconfig for Nationalchip
 gx6605s dev board.
In-Reply-To: <1488459830-18097-1-git-send-email-ren_guo@c-sky.com>
References: <1488459830-18097-1-git-send-email-ren_guo@c-sky.com>
Message-ID: <20170302141342.445dce13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Mar 2017 21:03:48 +0800, Guo Ren wrote:
> gx6605s is a nice SOC for dvbs2 DVB product, and C-SKY inside.
> 
> Signed-off-by: Guo Ren <ren_guo@c-sky.com>

Thanks again for your patch series, but you did not read carefully
enough the comments in my previous review.

Your patch 1/3 is adding board configuration for an architecture for
which the support is only added in patch 2/3. This doesn't make any
sense: I should be able to apply any number of the first patches in
your series, and still get something that make sense.

So:

 * Please merge patches 2/3 and 3/3 in just one patch, and make them
   the first patch.

 * Please move your current patch 1/3 as the second patch of your
   series.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
