From: scsijon <scsijon@lamiaworks.com.au>
Date: Fri, 2 Mar 2018 12:21:23 +1100
Subject: [Buildroot] SSD Kernel PCIe NVME Drivers?
Message-ID: <2095f39f-c9b0-f758-90c1-b89f057b786d@lamiaworks.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a copy of what I submitted for Puppy Linux and a few other 
"Linux's" I interact with. Since you are up to a RC I though i'd best 
check out buildroot. However I can't find anything for it in any of the 
linux kernel config files, so I thought I need to let you know to add 
it, especially as quite a lot of the mainstream laptops with 
touchscreens are either already using it or making it available as an 
option now.

The background doccument is a bit out of date, but for once it was 
written in a manner that most people are able to understand. :-)}

regards
scsijon

-------------------------------------
After doing some research I came across the fix for the NVME ssd 
problem. It's apparently a setting in the kernel, can you add it into 
your default set please as more and more notebooks are now using them.

Basically it's:-
Confirm that the NVMe Driver under Block is set to <M>
Go to Device Drivers -> Block Devices - > NVM Express block device
:and of course a driver is built.

There is also opensource test programs at:-
https://github.com/linux-nvme/nvme-cli

Full doc is:-
https://www.intel.com/content/dam/support/us/en/documents/ssdc/data-center-ssds/Intel_Linux_NVMe_Guide_330602-002.pdf

NVME Background worth reading can be found at:-
https://www.pcworld.com/article/2899351/everything-you-need-to-know-about-nvme.html
-----------------------------------------------------
