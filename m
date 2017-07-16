From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 16:19:01 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2017-06-30
In-Reply-To: <87lgnpal7b.fsf@dell.be.48ers.dk>
References: <1499277201-14030-1-git-send-email-nerv@dawncrow.de>
 <20170715120954.68067f9b@windsurf>
 <20170715124432.1573e49b@windsurf>
 <87lgnpal7b.fsf@dell.be.48ers.dk>
Message-ID: <20170716161901.5a88cc27@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 15:22:48 +0200, Peter Korsgaard wrote:

>  > So, I'm wondering what to do. Should I give up testing Buildroot on
>  > Debian Squeeze, and move to Debian Wheezy instead?  
> 
> With stretch out, I indeed think it makes sense to move away from
> squeeze. According to wikipedia squeeze is no longer supported (since
> Feb 2016):
> 
> https://en.wikipedia.org/wiki/Debian_version_history#Release_table
> 
> In general, I don't think it makes sense to test on any distribution no
> longer supported by their upstream.

Following your feedback and Yann's feedback, I've updated my chroot
from Squeeze to Wheezy. I've checked, and now Git clones from
github.com are working, as are wget downloads from cdn.kernel.org. This
should hopefully avoid a lot of bogus download failures.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
