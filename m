From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 14:37:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: security bump to
 version 2021.04
In-Reply-To: <20210418194332.3464292-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 18 Apr 2021 21:43:32 +0200")
References: <20210418194332.3464292-1-fontaine.fabrice@gmail.com>
Message-ID: <87mttlkyr6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Fix CVE-2021-27097: The boot loader in Das U-Boot before 2021.04-rc2
 >   mishandles a modified FIT.
 > - Fix CVE-2021-27138: The boot loader in Das U-Boot before 2021.04-rc2
 >   mishandles use of unit addresses in a FIT.

Are these really bugs in uboot-tools, E.G. the (host-side) tools and not
in u-boot itself?

-- 
Bye, Peter Korsgaard
