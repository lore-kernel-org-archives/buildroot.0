From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 5 Dec 2014 23:39:02 +0100
Subject: [Buildroot] [PATCH v4 00/14] Add Xorg support for iMX6
In-Reply-To: <5480B48A.8060705@gmail.com>
References: <1417514352-8825-1-git-send-email-jezz@sysmic.org>
 <547F63A4.9070007@gmail.com> <2598910.830VmRFfsL@aquila>
 <5480B48A.8060705@gmail.com>
Message-ID: <20141205233902.1981e3a1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Thu, 04 Dec 2014 11:22:50 -0800, Gary Bisson wrote:

> My understanding of it is to create a demo config like 
> qmx6_qt5_demo_defconfig whereas a qmx6_defconfig would stay minimal but 
> I might be wrong.

That's correct. I believe we want to continue to have minimal
defconfig, but we don't mind having bigger "demo" defconfigs. The
naming you proposed looks good to me.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
