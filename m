From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Sep 2017 01:37:26 +0200
Subject: [Buildroot] [PATCH v2 05/11] package/glibc: needs kernel
 headers >= 3.10 on powerpc64le
In-Reply-To: <ef182f62-d373-945b-c212-e5483c6d97a1@mind.be>
References: <20170902205423.21288-1-romain.naour@gmail.com>
 <20170902205423.21288-6-romain.naour@gmail.com>
 <20170910103032.GF3536@scaer>
 <ef182f62-d373-945b-c212-e5483c6d97a1@mind.be>
Message-ID: <20170912013726.474d54e8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Sep 2017 01:05:18 +0200, Arnout Vandecappelle wrote:

> 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 if BR2_powerpc64le

"depends on ... if ..." is not a valid Kconfig construct if I remember
correctly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
