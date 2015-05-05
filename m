From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 15:47:52 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <5548C932.3050502@zacarias.com.ar>
References: <20150505063016.079181016A5@stock.ovh.net>
 <20150505095952.4ddfd5b4@free-electrons.com>
 <5548C932.3050502@zacarias.com.ar>
Message-ID: <20150505154752.4757219c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Tue, 05 May 2015 10:44:18 -0300, Gustavo Zacarias wrote:

> Yes, md2 has been disabled for some time, the problem is that ipmiutil's
> configure uses LIB_DIR to check for md2 availability in libcrypto.
> But we can't override that otherwise libipmiutil doesn't get installed
> in the correct place :-/
> Quick solution is to force it off, ideally a well-done tests would be
> better.

Ok, thanks. Can you send a patch to force it off?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
