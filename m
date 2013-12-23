From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Dec 2013 17:45:22 +0100
Subject: [Buildroot] Booting problem for Beaglebone
In-Reply-To: <800187025.16985041.1387811298810.JavaMail.root@openwide.fr>
References: <52565A42.1080707@univ-st-etienne.fr>
 <800187025.16985041.1387811298810.JavaMail.root@openwide.fr>
Message-ID: <20131223174522.40f9884a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Pierre Ficheux,

On Mon, 23 Dec 2013 16:08:18 +0100 (CET), Pierre Ficheux wrote:

> I still have the same problem with recent BR (2013.11 or Git) and Beaglebone Black (waiting for root device)
> 
> [    4.690564]      host=10.5.16.129, domain=daviel.openwide.fr., nis-domain=(none)
> [    4.698407]      bootserver=0.0.0.0, rootserver=0.0.0.0, rootpath=
> [    4.704779]      nameserver0=10.5.1.1[    4.712875] Waiting for root device /dev/mmcblk0p4...

It generally means that the MMC driver is missing, or that the MMC
controller is not properly described in the Device Tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
