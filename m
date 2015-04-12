From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Apr 2015 18:54:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/exim: Adjust libnsl detection
 to include musl
In-Reply-To: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428848507-2117-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150412185443.08512d17@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Apr 2015 16:21:46 +0200, Bernd Kuhls wrote:
> Only (e)glibc provides libnsl, uclibc provides only a stub

True, but uClibc provides the functionality, no? Or is the stub
actually not working at runtime? Could you be a bit more specific here?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
