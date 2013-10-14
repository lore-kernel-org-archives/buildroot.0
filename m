From: Marco Trapanese <marcotrapanese@gmail.com>
Date: Mon, 14 Oct 2013 09:58:03 +0200
Subject: [Buildroot] Kernel module compiled but not found
In-Reply-To: <525B0CA6.6000103@mind.be>
References: <525AAE63.3060601@gmail.com>	<20131013145124.GA16563@free.fr>	<525AB5F9.8090907@gmail.com>
 <20131013170541.398d8907@skate> <525AB9F0.3020708@gmail.com>
 <525B0CA6.6000103@mind.be>
Message-ID: <525BA40B.1070604@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 13/10/2013 23:12, Arnout Vandecappelle ha scritto:
>  The module is in the driver directory, so I guess this should be 
> M=$(@D)/driver


Good shot!!!
Now it tries to compile, indeed!

It fails but I know why. I'm going to ask a question about patching. But 
this issue is fixed!

Thanks
Mark
