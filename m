From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Jul 2018 14:00:04 +0200
Subject: [Buildroot] [PATCH 1/1] boost: filesystem needs system
In-Reply-To: <20180701114051.20473-1-fontaine.fabrice@gmail.com>
References: <20180701114051.20473-1-fontaine.fabrice@gmail.com>
Message-ID: <20180701140004.6546cf51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  1 Jul 2018 13:40:51 +0200, Fabrice Fontaine wrote:
> readelf -d output/staging/usr/lib/libboost_filesystem.so
> [...]
> [libboost_system.so.1.67.0]

Why do you cut the output of commands? It's OK if it's larger than 72
characters.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
