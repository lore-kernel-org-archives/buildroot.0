From: Erico Nunes <nunes.erico@gmail.com>
Date: Wed, 24 May 2017 23:51:42 +0200
Subject: [Buildroot] [PATCH 2/2] package: xen: Depend on the host-acpica
	package
In-Reply-To: <20170524203030.8187-3-alistair.francis@xilinx.com>
References: <20170524203030.8187-1-alistair.francis@xilinx.com>
 <20170524203030.8187-3-alistair.francis@xilinx.com>
Message-ID: <CAK4VdL141FkuX4h12OY5uVXeEPz66tYTh+_phwY+qJyRe_OHsg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 24, 2017 at 10:30 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> Add a dependency on the host ACPICA package as Xen tools require iasl to
> build.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>

Acked-by: Erico Nunes <nunes.erico@gmail.com>
