From: Matthew Weber <mlweber1@rockwellcollins.com>
Date: Mon, 2 Dec 2013 22:04:00 -0600
Subject: [Buildroot] Moschip MCS8142 SoC
In-Reply-To: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
References: <1485435858.899015.1385143819916.JavaMail.root@telenet.be>
Message-ID: <OFA1E9F549.035B351F-ON86257C36.00138A7C-86257C36.001656E7@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anyone happened to work with this Moschip SoC?  I found Linux BSP 
patches for the MCS8140 (OpenWRT 3.3 Kernel plus some initial attempts at 
mainlining around 3.7), however that MCS8140 SoC was a true ARMv5 compared 
to the MCS8142 seems to be based on a Faraday fa526 ARMv4.  Plus I'm not 
to sure if the bus and peripheral architecture are simliar (need to do a 
little more research yet).

Any help is appreciated (reference docs that outline the register 
definition, etc.) .  We're trying to get a 3.x kernel running on this 
target to replace a older 2.6.24 blob that we can't get source for.....

Thanks!

Matthew L Weber / Sr Software Engineer / Platform SW 
mlweber1 at rockwellcollins.com


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131202/4ae22c2d/attachment-0001.html>
