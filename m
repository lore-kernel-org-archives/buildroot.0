From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Apr 2017 15:32:39 +0200
Subject: [Buildroot] [PATCH v3] package: protobuf/python-protobuf: bump
 to v3.2.0.
In-Reply-To: <20170421160637.6206-1-mrugiero@gmail.com>
References: <20170417172225.20472-1-mrugiero@gmail.com>
 <20170421160637.6206-1-mrugiero@gmail.com>
Message-ID: <20170422153239.2c0fc6a2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Apr 2017 13:06:37 -0300, mrugiero at gmail.com wrote:
> From: "Mario J. Rugiero" <mrugiero@gmail.com>
> 
> Both packages are coupled, so both were bumped and build-tested.
> The atomics' support patch is no longer needed, and neither is
> the autoreconf option, and SPARC64 is no longer broken.
> To make sure of this, one config of each of the following archs
> was tested (base defconfig in parens):
> PowerPC (qemu_ppc_g3beige_defconfig)
> SPARC (qemu_sparc_ss10_defconfig)
> SPARC64 (qemu_sparc64_sun4u_defconfig)
> 
> Signed-off-by: Mario J. Rugiero <mrugiero@gmail.com>
> ---
>  ...configure.ac-check-if-libatomic-is-needed.patch | 34 ----------------------
>  package/protobuf/Config.in                         |  6 +---
>  package/protobuf/protobuf.hash                     |  2 +-
>  package/protobuf/protobuf.mk                       |  7 ++---
>  package/python-protobuf/python-protobuf.hash       |  3 +-
>  package/python-protobuf/python-protobuf.mk         |  2 +-
>  6 files changed, 8 insertions(+), 46 deletions(-)
>  delete mode 100644 package/protobuf/0001-configure.ac-check-if-libatomic-is-needed.patch
>  mode change 120000 => 100644 package/python-protobuf/python-protobuf.hash

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
