From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Feb 2014 22:37:12 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-09
In-Reply-To: <20140210073010.EB93B100ECC@stock.ovh.net>
References: <20140210073010.EB93B100ECC@stock.ovh.net>
Message-ID: <20140210223712.05044b5a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 10 Feb 2014 08:30:10 +0100 (CET), Thomas Petazzoni wrote:

> Classification of failures by reason
> ====================================
> 
> Makefile.legacy:27: *** "Th... | 994

This problem is now fixed, and I've removed all the bogus results from
the autobuilder database, so that tomorrow results should look fine.

Sorry for the mess, but I wasn't around this week-end, and I didn't had
the time to fix the test infrastructure before the BUILDROOT_DL_DIR ->
BR2_DL_DIR patch was merged.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
