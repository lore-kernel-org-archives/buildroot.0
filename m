From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 Jan 2019 20:58:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/irqbalance: bump to version
 1.5.0
In-Reply-To: <20190104105341.25481-1-F.LaRoche@pilz.de> (Florian La Roche's
 message of "Fri, 4 Jan 2019 11:53:41 +0100")
References: <20190104105341.25481-1-F.LaRoche@pilz.de>
Message-ID: <87sgy5fthp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Florian" == Florian La Roche <F.LaRoche@pilz.de> writes:

 > From the upstream changelog:
 > New Features in irqbalance 1.5.0
 > * file based socket ipc mechanism
 > * support for multiple policy scripts
 > * add some sandboxing support
 > * enhanced debug output
 > * Imroved irq type determination for ARM
 > Bugs fixed:
 > * Fixed xen event interrupt detection
 > * Fix node parsing in sysfs
 > * Covscan fixes
 > * Fix use on systems without a pci bus
 > * Various other cleanups

 > Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
