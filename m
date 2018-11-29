From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 22:14:45 +0100
Subject: [Buildroot] [PATCH v2] gcc: Enable __cxa_atexit for final GCC
In-Reply-To: <20181116112618.17034-1-abrodkin@synopsys.com>
References: <20181116112618.17034-1-abrodkin@synopsys.com>
Message-ID: <20181129221445.4d68439f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 16 Nov 2018 14:26:18 +0300, Alexey Brodkin wrote:
> This is what GCC manual says [1]:
> -------------------------->8----------------------  
> --enable-__cxa_atexit

I've applied to next, but after dropping the "for final GCC" from the
commit title, since cxa_atexit is now used for both the initial gcc and
the final gcc.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
