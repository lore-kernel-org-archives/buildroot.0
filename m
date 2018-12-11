From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Dec 2018 11:31:33 +0100
Subject: [Buildroot] Buildroot autobuilder: ARC toolchain update
In-Reply-To: <6e005856992c28fbfadecb94ec17cd55f712a615.camel@synopsys.com>
References: <6e005856992c28fbfadecb94ec17cd55f712a615.camel@synopsys.com>
Message-ID: <20181211113133.7929d083@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Dec 2018 10:24:39 +0000, Alexey Brodkin wrote:

> Now with arc-2018.09 tools integrated in Buildroot may we
> have it packages in prebuilt tarball so autobuilder uses it
> instead of pretty old br-arcle-hs38-full-2018.05.tar.bz2?

I did a rebuild of all toolchains not long ago, but did not deploy it
yet. Also, it was before the bump of ARC tools to 2018.09.

However, notice that the 2018.09 ARC tools are already tested in the
autobuilders, because we have a config fragment that uses the internal
toolchain backend for ARC:

  https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild/br-arc-full-internal.config
  https://git.buildroot.org/buildroot/tree/support/config-fragments/autobuild/br-arc-internal-glibc.config

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
