From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 09:08:00 +0100
Subject: [Buildroot] [PATCH 1/1] toolchain-external: improve musl
 external check
In-Reply-To: <20170322080651.GC29607@uxa>
References: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
 <20170321231856.014bc6a7@free-electrons.com>
 <20170322080651.GC29607@uxa>
Message-ID: <20170322090800.6099243a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 22 Mar 2017 11:06:51 +0300, Ilya Kuzmich wrote:
> Current check fails on crosstool-ng musl toolchain,
> ctng puts libc.so at sysroot/usr/lib/, not sysroot/lib

OK, thanks, makes sense. I'll update the commit log with this
explanation when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
