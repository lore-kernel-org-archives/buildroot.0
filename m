From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 21:33:20 +0200
Subject: [Buildroot] [PATCH v6 4/5] package/docker-engine: proper sysv
	init file
In-Reply-To: <CA+h8R2pize3Jgqxx1z3syWJXKWM7WoN0nrdxVrnmPDJ8=FxqDQ@mail.gmail.com>
References: <1467660382-6317-1-git-send-email-christian@paral.in>
 <1467660382-6317-4-git-send-email-christian@paral.in>
 <CA+h8R2pize3Jgqxx1z3syWJXKWM7WoN0nrdxVrnmPDJ8=FxqDQ@mail.gmail.com>
Message-ID: <20160704213320.1aff9bce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Jul 2016 12:28:07 -0700, Christian Stewart wrote:
> All,
> 
> Acked-by: Christian Stewart <christian@paral.in>
> > Signed-off-by: Andrew Webster <awebster@arcx.com>
> > Signed-off-by: Christian Stewart <christian@paral.in>
> >
> >  
> No idea why it added my signed-off again automatically, I just wanted to
> leave the ack, please excuse my random signed-off-by duplicates all over
> this series.

The fact that it added your SoB is actually good. When you carry the
patch from someone else, you need to SoB on his patch, because the
chain of SoB indicates the chain of persons through which the patch has
gone. That's why Peter and I also add our SoB when we apply and merge
patches in Buildroot.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
