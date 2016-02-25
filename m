From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 Feb 2016 14:26:22 +0100
Subject: [Buildroot] [PATCH 2/2] host-m4: fix build when -std=gnu99 and
 inline functions are used
In-Reply-To: <1456405085.2312.2.camel@synopsys.com>
References: <1456400230-4187-1-git-send-email-ltrimas@synopsys.com>
 <1456400230-4187-3-git-send-email-ltrimas@synopsys.com>
 <20160225135436.18a8385c@free-electrons.com>
 <1456405085.2312.2.camel@synopsys.com>
Message-ID: <20160225142622.47b2841a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 25 Feb 2016 12:58:05 +0000, Lada Trimasova wrote:

> I used CentOS 5.7, gcc 4.9.2, glibc 2.5.

Are you talking about gcc 4.9 for the target or gcc 4.9 for the host ?

It seems weird to be using such a recent gcc version with such an
ancient glibc version.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
