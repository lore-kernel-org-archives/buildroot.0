From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:37:07 +0100
Subject: [Buildroot] [PATCH] stella: fix bug when compiling with PPC
 altivec vectorization
In-Reply-To: <CANu7NGu=fPj30W2A596uyn=+kaYkK07M3U-So7RLmMhk41Vvrg@mail.gmail.com>
References: <1479404832-11783-1-git-send-email-sergio.prado@e-labworks.com>
 <20161119105927.57bd516a@free-electrons.com>
 <20161122233337.GA2566@tungsten.ozlabs.ibm.com>
 <CANu7NGu=fPj30W2A596uyn=+kaYkK07M3U-So7RLmMhk41Vvrg@mail.gmail.com>
Message-ID: <20161126153707.1238f739@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Nov 2016 19:59:11 -0200, Sergio Prado wrote:

> Your solution is simpler and seems reasonable to just change from c++11 to
> gnu++11. I will do some tests on x86 and ARM and let you know the results.

Great, thanks. I'll mark your patch as Changes Requested in patchwork.
Can you resubmit a simplified version?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
