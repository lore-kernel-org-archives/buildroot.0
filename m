From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jun 2015 14:26:23 +0200
Subject: [Buildroot] [PATCH] enlightment: xtensa workaround no longer
 required
In-Reply-To: <20150626184150.GA26274@waldemar-brodkorb.de>
References: <20150626184150.GA26274@waldemar-brodkorb.de>
Message-ID: <20150628142623.0bdee571@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Brodkorb,

On Fri, 26 Jun 2015 20:41:50 +0200, Waldemar Brodkorb wrote:
> With the update to uClibc-ng 1.0.3, this is no longer needed,
> as the problem is fixed upstream.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

We have an external Xtensa toolchain in the autobuilders, see
http://autobuild.buildroot.org/toolchains/configs/br-xtensa-full.config.
It has been built with Buildroot 2015.05, so I believe it was already
using uClibc-ng. Can you just confirm that this package builds fine
with this toolchain?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
