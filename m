From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Oct 2017 12:35:38 +0200
Subject: [Buildroot] [PATCH 1/2] configs/atmel: bump to linux4sam_5.7
In-Reply-To: <20171006100825.11378-1-nicolas.ferre@microchip.com> (Nicolas
 Ferre's message of "Fri, 6 Oct 2017 12:08:25 +0200")
References: <20171006100825.11378-1-nicolas.ferre@microchip.com>
Message-ID: <87lgkofts5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nicolas" == Nicolas Ferre <nicolas.ferre@microchip.com> writes:

 > Bump at91sam9x5ek, atmel_sama5d2_xplained, atmel_sama5d3_xplained and
 > atmel_sama5d4_xplained all variants to linux4sam_5.7. The 3 foundation
 > components have their tags changed (AT91Bootstrap, U-Boot, Linux kernel).

 > Signed-off-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Committed, thanks.

 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.7"

4.9.53 is out, so time to rebase ;)

-- 
Bye, Peter Korsgaard
