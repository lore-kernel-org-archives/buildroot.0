From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 May 2020 16:11:08 +0200
Subject: [Buildroot] [PATCH 2/2] package/qemu: bump to 5.0.0
In-Reply-To: <20200502161031.4d93faf2@windsurf.home>
References: <20200502135205.1084120-1-romain.naour@gmail.com>
 <20200502135205.1084120-2-romain.naour@gmail.com>
 <20200502161031.4d93faf2@windsurf.home>
Message-ID: <20200502161108.741738d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2 May 2020 16:10:31 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> We don't have any host-libcap-ng package, we only have the target
> variant for libcap-ng, so I don't think this can build.

Of course, scratch that. When a patch series has two patches, I should
read the first patch of the series before the second patch.

Sorry for the noise :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
