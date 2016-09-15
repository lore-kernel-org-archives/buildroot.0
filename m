From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Sep 2016 21:22:33 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
 root filesystem removal
In-Reply-To: <87k2edeay4.fsf@dell.be.48ers.dk>
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
Message-ID: <20160915212233.6ed8f466@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Sep 2016 12:04:03 +0200, Peter Korsgaard wrote:

>  > When such conditions are met, Buildroot will run "rm -rf /*" due to
>  > TOOLCHAIN_EXTERNAL_INSTALL_DIR being empty.  
> 
>  > This bug does not exist in 2016.05, and appeared in 2016.08 due to
>  > commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79.  
> 
> Gaah - Committed, thanks!

I hope you did some good review on it. The last patches touching this
have seen how catastrophic "apparently good looking" patches can be.

> I'll put out a 2016.08.1 release with this Saturday or Sunday. Anything
> else that should be included in this bugfix release?

Not that I can remember, though Arnout gave some suggestions already.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
