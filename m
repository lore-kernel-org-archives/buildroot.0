From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 22 Aug 2018 13:46:27 +0200
Subject: [Buildroot] [PATCH next 0/4] btrfs-progs related improvements
In-Reply-To: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
References: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180822134627.077c501d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 23:59:50 +0200, Thomas Petazzoni wrote:

> Thomas Petazzoni (4):
>   lzo: build shared library for the host
>   e2fsprogs: build shared library for the host
>   btrfs-progs: drop dependency on e2fsprogs by not building
>     btrfs-convert
>   btrfs-progs: make e2fsprogs an optional dependency

All applied to next. Thanks Yann for the review!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
