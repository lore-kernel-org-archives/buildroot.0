From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 May 2016 20:43:26 +0200
Subject: [Buildroot] [PATCH 1/2] package/jack2: Fix build on xtensa
In-Reply-To: <20160523223033.0500246d@free-electrons.com>
References: <1464022076-24135-1-git-send-email-bernd.kuhls@t-online.de>
 <20160523223033.0500246d@free-electrons.com>
Message-ID: <20160526204326.2308bcad@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 23 May 2016 22:30:33 +0200, Thomas Petazzoni wrote:

> I've tested that it properly detects the absence of NGREG on Xtensa.
> However, I have not tested on architectures where it exists, so I hope
> I didn't do any typo.

Bernd, do you think you will have some time to propose a patch based on
something similar to what I suggested, to fix the NGREG jack2 failure?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
