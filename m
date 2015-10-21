From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Oct 2015 10:20:01 +0200
Subject: [Buildroot] [PATCH 1/1] Fix Image name not configurable (issue
 #28).
In-Reply-To: <5627458F.4020108@mclink.it>
References: <1440842823-1283-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-1-git-send-email-mc5686@mclink.it>
 <1440845031-3965-2-git-send-email-mc5686@mclink.it>
 <20150829115935.GC4857@free.fr> <55E1DDB9.6040101@mclink.it>
 <20150831093214.6ae89b8a@free-electrons.com>
 <20150831081740.GA3596@free.fr> <55E44D1B.5050207@mclink.it>
 <5627458F.4020108@mclink.it>
Message-ID: <20151021102001.176f33d2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mauro Condarelli,

On Wed, 21 Oct 2015 09:58:07 +0200, Mauro Condarelli wrote:
> Hi,
> I received today (!) answer from upstream:
> ============= see: https://github.com/linux4sam/at91bootstrap/issues/28#issuecomment-149745536 ==============
> 
> Hello,
> 
> Yes, it is not configurable, making it configurable is more comfortable.
> We accepted your advice. Thank you for your support.
> 
> Best Regards,
> Wenyou Yang
> 
> ========================================================================================
> I thus assume my original (not the more convoluted one I submitted later) patch can be backported.
> 
> Please advise about what I should do.

You need to get the patch actually accepted upstream, and once it is
accepted, backport it into Buildroot (as a temporary solution until
upstream makes a new release that includes your change).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
