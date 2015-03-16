From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:30:54 +0100
Subject: [Buildroot] Printing-related packages deprecated: cups,
 foomatic-filters, gutenprint and hplip
Message-ID: <20150316223054.587aa86a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

If you're interested in printing related packages in Buildroot, or
want to help Buildroot in general, read on.

We have just marked the "CUPS" package deprecated. It has not been
updated since May 2012, and our currently packaged version is 1.3.11
while upstream is at 2.0.2. Older versions such as 1.3.11 are known to
have major security issues, so we cannot continue to have it packaged
in Buildroot.

You can help by packaging CUPS 2.0.2, and also updating
foomatic-filters, gutenprint and hplip if needed.

Thanks for your help,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
