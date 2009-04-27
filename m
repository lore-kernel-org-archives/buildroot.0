From: Steffen Schulz <pepe_ml@gmx.net>
Date: Mon, 27 Apr 2009 19:36:26 +0200
Subject: [Buildroot] No network interface when used as DomU
Message-ID: <20090427173625.GA19953@cbg.dyndns.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


I've created a simple cpio.gz with tcpdump, ssh, bridge etc. Nothing
fancy.

When I use that with a paravirtualized Kernel(openSuse 2.6.27) to
start a DomU in a openSuse 2.6.27-xen, the VM does not have any vif
interfaces. It works for full virtualisation+direct boot using Qemu.

And the xen configuration also works for other paravirt-VMs.

Does anybody know what this can be? Do I need to compile against
xen-kernel? Am I missing some switches? Does some lib/tool not support
virtual xen interfaces?

thanks,
Steffen
-- 
pepe at unixfan.net                            gpg --recv-key A04D7875
Key fingerprint: B805 57BE E4AF 0104 CC51  77A1 CE6F 8D46 A04D 7875
