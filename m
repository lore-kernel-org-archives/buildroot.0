From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Feb 2016 22:22:54 +0100
Subject: [Buildroot] Add different glibc
In-Reply-To: <56D357C5.8040000@gmx.de>
References: <56D357C5.8040000@gmx.de>
Message-ID: <20160228222254.62d8af48@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Tobias,

On Sun, 28 Feb 2016 21:25:41 +0100, Tobias Andresen wrote:

> can someone give me a hint how to add a different glibc as a package 
> which will be copied into the rootfs instead of the
> glibc which is part of the toolchain?

Why would you want to do this?

In any case, you can customize whatever is in your root filesystem by
creating a post-build script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
