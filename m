From: DATACOM - Tiago.Brusamarello <tiago.brusamarello@datacom.ind.br>
Date: Thu, 17 Mar 2016 09:55:44 -0300 (BRT)
Subject: [Buildroot] How to check if a platform supports PCI bus
Message-ID: <900813099.3374314.1458219344699.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello. 

I'm about to submit a new package to the upstream. This package is intended to be used for testing the Linux PCIe driver. On the "Config.in" file I'm using the same check made by the "pciutils" package: 

# PCI not supported on Blackfin 
depends on !BR2_bfin 

Is this correct to check if a platform supports PCI bus on Buildroot? 

Regards, 

-- 
Tiago. 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160317/f6384fd6/attachment.html>
