From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 17:47:50 +0200
Subject: [Buildroot] [PATCH 2/2] qemu/x86: add defconfig for serial
 console usage
In-Reply-To: <20140730134403.GA11974@waldemar-brodkorb.de>
References: <20140730134403.GA11974@waldemar-brodkorb.de>
Message-ID: <20140730174750.34c1d272@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Wed, 30 Jul 2014 15:44:11 +0200, Waldemar Brodkorb wrote:

> A config which can be used for both cases might be used instead,
> but I see no option to add more gettys via the existing buildroot
> variables.

A rootfs overlay that overrides inittab, or a post-build script that
tunes the inittab.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
