From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 16 Nov 2012 11:33:43 +0100
Subject: [Buildroot] [git commit] lcdproc: fix autobuilder failures
In-Reply-To: <CAHt8ZCNQwhHyxiVy5pMtq5KJnYKS2RHm=0sOPp2VH5s7BePF3Q@mail.gmail.com>
References: <20121115230738.33E869A031@busybox.osuosl.org>
 <20121116004452.635cf645@skate>
 <CAHt8ZCNQwhHyxiVy5pMtq5KJnYKS2RHm=0sOPp2VH5s7BePF3Q@mail.gmail.com>
Message-ID: <20121116113343.15dd3eb3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 16 Nov 2012 09:07:55 +0000, Simon Dawson wrote:

> If lcdproc finds freetype in the staging area, then the host header
> and library search paths do not get added to the build commands. So I
> think this patch does more than simply work around the problem.

Ok, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
