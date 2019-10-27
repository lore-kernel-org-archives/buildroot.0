From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 Oct 2019 16:30:53 +0100
Subject: [Buildroot] [PATCH v2] doc/manual/configure.txt: add a short
 tutorial to reuse a Buildroot toolchain as external toolchain
In-Reply-To: <20191027103912.17402-1-romain.naour@smile.fr>
References: <20191027103912.17402-1-romain.naour@smile.fr>
Message-ID: <20191027163053.6bbd1648@windsurf.dhcp.lyon.intranet>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Oct 2019 11:39:12 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Laurent reported that a short tutorial was missing in the manual to
> explain how to reuse a Buildroot toolchain as external toolchain.
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Laurent Guillier <laurent.guillier@smile.fr>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
> v2: Merge Matt's review and comments.

So, I've applied, but after reworking it significantly. First, it
really needed to be in a separate section, and not buried inside the
existing "External toolchain" section.

Then, it was really more complicated than it needed to be: all these
details about using out of tree build and so on were not relevant. You
can do all of that without out of tree build: do a first build for your
toolchain, produce the tarball, and then re-use that tarball for your
other Buildroot projects.

So I really simplified a lot the instructions. Feel free to have a
look, and send additional updates if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
