From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Aug 2017 09:25:56 +0200
Subject: [Buildroot] [PATCH] fs/squashfs: honour the number of parallel
 jobs
In-Reply-To: <20170802212239.27167-1-yann.morin.1998@free.fr>
References: <20170802212239.27167-1-yann.morin.1998@free.fr>
Message-ID: <20170803092556.752dfa19@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 Aug 2017 23:22:39 +0200, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>

This would benefit from an extended commit log. Why do we do this? Is
this fixing something? Is this reducing the duration of mksquashfs
because it leverages multiple cores when doing the compression? In the
latter case, a few numbers would be nice to have.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
