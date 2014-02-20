From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Feb 2014 11:18:03 +0100
Subject: [Buildroot] [PATCH] webkit: disable on < ARMv5t
In-Reply-To: <5305D126.6050109@mind.be>
References: <1392847730-14412-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53059EBE.6030902@mind.be> <20140220090555.42dc8d0d@skate>
 <5305D126.6050109@mind.be>
Message-ID: <20140220111803.563d7f00@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 20 Feb 2014 10:55:50 +0100, Arnout Vandecappelle wrote:

>  For all the other architectures. That's why it says BR2_i386 and not
> BR2_arm :-)

Ok.

>  For BR2_arm it is not possible because you have an &&. Well, you could
> put BR2_arm and BR2_armeb on separate lines but then you have to repeat
> all the exclusions - not so nice.

Correct.

But then for the other architectures, it also makes a certain of lines
that I really short. I guess it's a matter of taste, I don't really
care. Can you submit a patch against master to change this, since the
patch has already been merged?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
