From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 12:26:55 +0200
Subject: [Buildroot] [PATCH] ext-toolchain: MIPS: Select correct
 endianness for the target
In-Reply-To: <525BC5C1.3050705@imgtec.com>
References: <1381744345-8306-1-git-send-email-markos.chandras@imgtec.com>
 <20131014120543.267c23a7@skate> <525BC5C1.3050705@imgtec.com>
Message-ID: <20131014122655.76c12547@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 14 Oct 2013 11:21:53 +0100, Markos Chandras wrote:

> > Should we do it for -EB as well? Or do we consider because the Sourcery
> > toolchain defaults to big endian we don't need to explicit -EB ?
> 
> It's not necessary because the default is for big endian. But if you 
> prefer to do that for the sake of consinstency I am fine with it :)
> 
> Peter can you fix this patch before you commit it or should I send a v2?

I have a bunch of other external toolchain / toolchain patches, so I
can take your patch as well and send a global patch series to Peter.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
