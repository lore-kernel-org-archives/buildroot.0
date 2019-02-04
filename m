From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 21:02:32 +0100
Subject: [Buildroot] [PATCH v2 3/3] support/config-fragments: add Andes
 32-bit (nds32) to autobuild configs
In-Reply-To: <20190123123947.5084-4-nylon7@andestech.com>
References: <20190123123947.5084-1-nylon7@andestech.com>
 <20190123123947.5084-4-nylon7@andestech.com>
Message-ID: <20190204210232.0e99d517@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Jan 2019 20:39:47 +0800
Nylon Chen <nylon7@andestech.com> wrote:

> Add a minimal nds32 autobuild configuration for the
> internal toolchain with glibc.

This autobuild configuration is using an external toolchain, so it is
not at all testing "internal toolchain with glibc".

Also, are you ok with analyzing the build failures that will be
reported by our autobuilders for the nds32 architecture, investigate
them and provide fixes ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
