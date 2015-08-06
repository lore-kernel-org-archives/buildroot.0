From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 08:56:21 +0200
Subject: [Buildroot] [PATCH 2/2] package/poco: disable for static build
In-Reply-To: <1438682248-29767-2-git-send-email-joerg.krause@embedded.rocks>
References: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
 <1438682248-29767-2-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150806085621.2399e5ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Tue,  4 Aug 2015 11:57:28 +0200, J?rg Krause wrote:
> poco requires dlopen()
> 
> Fixes:
> http://autobuild.buildroot.net/results/952/952f05efd245ba59991f3c5be02a0572e8b9e544/
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

There should be an empty line before the SoB line.

Also, there is a --no-sharedlibs option in poco's configure script that
is supposed to support statically linked environment. However, it does
not work.

So I've applied your patch after amending the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
