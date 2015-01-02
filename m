From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Jan 2015 19:23:04 +0100
Subject: [Buildroot] [v2 1/2] caps: new package
In-Reply-To: <53E29D7E.4020906@barkynet.com>
References: <1407283327-5150-1-git-send-email-martin@barkynet.com>
 <20140806221449.2aff1359@free-electrons.com>
 <53E29D7E.4020906@barkynet.com>
Message-ID: <20150102192304.42b27c44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Martin Bark,

On Wed, 06 Aug 2014 22:26:22 +0100, Martin Bark wrote:

> Thanks for running the test.  After a quick looks it seems the finite() 
> and pow10f() functions are the issue.  I tried a quick change to use 
> isfinite() and powf(10,x) instead and that builds.
> 
> I'm off on holiday now for a week so I?ll create an updated patch when i 
> get back.

Any news about this?

Since you did not send updated versions of this patch, I'll mark this
patch, and the following one add alsaequal as "Changes Requested" in
patchwork. Therefore, if you would like to see those patches merged in
Buildroot, could you resend an updated versions that fixes the build
issues that I reported back in August?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
