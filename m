From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Jul 2017 09:53:41 +0200
Subject: [Buildroot] [PATCH 1/2] arch/mips: improve help text of NaN
 option
In-Reply-To: <dfd6e917-4f2a-2d0a-b3d7-1d805f8ddd71@imgtec.com>
References: <20170717122255.61795-1-Vincent.Riera@imgtec.com>
 <20170717145613.3c7feb8a@windsurf>
 <dfd6e917-4f2a-2d0a-b3d7-1d805f8ddd71@imgtec.com>
Message-ID: <20170718095341.0bd7b437@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Jul 2017 17:57:22 +0100, Vicente Olivert Riera wrote:

> > Is it useful (and correct?) to say that the Linux kernel, built for
> > MIPS32r5, by default expect the 2008 NaN encoding?  
> 
> It is correct, but since nan2008 is the default I think is not worth
> mentioning it. If you change the default value is because you know what
> you are doing, right?

OK, makes sense. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
