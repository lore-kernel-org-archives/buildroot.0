From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Nov 2019 22:04:06 +0100
Subject: [Buildroot] [PATCH RFC 0/2] Fix conflict between host-dtc
 headers and kernel dtc
In-Reply-To: <20191103151258.11047-1-unixmania@gmail.com>
References: <20191103151258.11047-1-unixmania@gmail.com>
Message-ID: <20191115220406.45014662@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 Nov 2019 12:12:56 -0300
unixmania at gmail.com wrote:

> Carlos Santos (2):
>   package/dtc: install host libfdt headers in a subdirectory
>   package/qemu: search for host-dtc (libfdt) headers at the right place

Thanks, looks like a good idea, so I've applied both patches to the
next branch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
