From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Jul 2013 16:05:41 +0200
Subject: [Buildroot] [PATCH 3/8] arch: improve ARM floating point
 support and add support for EABIhf
In-Reply-To: <87r4fagkx3.fsf@dell.be.48ers.dk>
References: <1373123292-15085-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373123292-15085-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87r4fagkx3.fsf@dell.be.48ers.dk>
Message-ID: <20130708160541.7a78c59c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Sun, 07 Jul 2013 22:44:08 +0200, Peter Korsgaard wrote:

> Looks good. You could argue that we should do:
> 
>       default BR2_ARM_EABIHF
> 
> instead (E.G. default to eabihf if available, otherwise fall back to
> eabi), but with all the optional vfp units it's perhaps better to play
> it safe..

Yeah, I thought that defaulting on eabihf today (for ARMv7) was a bit
too much. I played conservative, and remained on eabi by default.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
