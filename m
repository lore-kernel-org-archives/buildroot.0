From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 08:58:20 +0100
Subject: [Buildroot] [PATCH] fix eudev really not depending kernel
 headers >=3.9
In-Reply-To: <54FA4FD7.6080206@gmail.com>
References: <1425661783-26577-1-git-send-email-swexru@gmail.com>
 <20150306234837.0e201d35@free-electrons.com>
 <54FA4FD7.6080206@gmail.com>
Message-ID: <20150307085820.78e0d5c2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alexey Mednyy,

On Sat, 07 Mar 2015 04:09:43 +0300, Alexey Mednyy wrote:

> > On which kernel headers version does eudev now depends? If it really
> > builds with old 2.6 kernel headers, then just get rid of this line
> > instead of commenting it out.
> I'm currently successfully built roots with headers of 2.6.36 and yes I
> used to delete this line, but forgot it (commented and started test
> build). Will fix in patch v2.

Ok, then it's alright, just remove this line.

> > Can you expand a little bit on how this can work? Maybe I missed
> > something obvious?
> I'm not sure why, but seem older kernels - reason for inclusion of
> BTRFS_IOC_DEVICES_READY in src/shared/missing.h header in eudev.

Ah, yes, indeed that's how it can work. Thanks for the clarification.

Then yes, please resend a v2 with a better title, and the "depends on"
line removed instead of commented out.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
