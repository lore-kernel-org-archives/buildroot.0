From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:04:45 +0100
Subject: [Buildroot] [PATCH] package/snort: fix error when building on a
 Fedora host machine
In-Reply-To: <20191222091707.31637-1-sergio.prado@e-labworks.com>
References: <20191222091707.31637-1-sergio.prado@e-labworks.com>
Message-ID: <20191222110445.0118f795@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 22 Dec 2019 06:17:07 -0300
Sergio Prado <sergio.prado@e-labworks.com> wrote:

> Remove a logic from configure script that adds unsafe header/library path when
> cross-compiling on a Fedora host machine.
> 
> Fixes:
> http://autobuild.buildroot.net/results/47a367c2c5cbf13079b0e60ad7ebe3dbd05756d4
> http://autobuild.buildroot.net/results/837e43b085ac30fb8545c67352403ceb7de59976
> http://autobuild.buildroot.net/results/a69df3959b45620f811c18744aa661caa479aef4
> many more...
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  ...en-building-on-a-Fedora-host-machine.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch

Applied to master, thanks. Could you report this bug to the upstream
Snort developers, so that they can implement a solution that works well even
in cross-compilation situations ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
