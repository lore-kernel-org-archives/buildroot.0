From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 09:22:18 +0200
Subject: [Buildroot] [PATCH 1/1] board/arcturus/ppc-ucp1020 new gcc-6.x
 Linux kernel build fix
In-Reply-To: <940b0331-fb4e-e75d-b747-f9c282491c24@arcturusnetworks.com>
References: <20170713163817.7114-1-oleks@arcturusnetworks.com>
 <20170713193059.08c08974@windsurf>
 <940b0331-fb4e-e75d-b747-f9c282491c24@arcturusnetworks.com>
Message-ID: <20170714092218.3a548944@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 15:21:08 -0400, Oleksandr G Zhadan wrote:

> Yes, uprating to newer kernel is on our list. And we know that it is a 
> fix there.
> But, It will take some time to re-test all ours and our existing 
> customers apps. And as usually we do not have that time now ;-).
> For now we would like to fix uCP1020 buildroot build in any way: or by 
> downgrading GCC or with that Linux-3.18 patch.
> Please apply any of the patches and when we will be ready we will send 
> another, new "kernel patch".

OK. As long as upgrading to a newer kernel is on your list, I'm fine
with having this patch as a temporary solution.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
