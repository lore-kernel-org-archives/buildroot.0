From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 11:47:50 +0100
Subject: [Buildroot] [PATCH v2 2/8] package/python-scapy3k: : remove 'v'
 prefix
In-Reply-To: <20191027100722.64156-2-matthew.weber@rockwellcollins.com>
References: <20191027100722.64156-1-matthew.weber@rockwellcollins.com>
 <20191027100722.64156-2-matthew.weber@rockwellcollins.com>
Message-ID: <20191027114750.1e4c989e@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 27 Oct 2019 05:07:16 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> Fixes version parsing for release-monitoring.org support.
> 
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

This doesn't work here:

ERROR: python-scapy3k-0.18.tar.gz has wrong sha256 hash:
ERROR: expected: a4c68ef2f787d82a3aec8640cac8dbab6f5b9e31ae4d89a1877efbb9150a9e25
ERROR: got     : 3717913cb54f211918eccb65fad9ccf8a66bd542a4a659b2c0ac762db08eb766
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
