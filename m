From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 30 Jan 2019 21:20:28 +0100
Subject: [Buildroot] [PATCH] Makefile: add update-defconfig target
In-Reply-To: <20190126003406.7723-1-vivien.didelot@gmail.com>
References: <20190126003406.7723-1-vivien.didelot@gmail.com>
Message-ID: <CAAXf6LXNq9PiMst0ONaXp=StcJCimU97ie-bnWFNuTyCcsX5ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El s?b., 26 ene. 2019 a las 1:34, Vivien Didelot
(<vivien.didelot@gmail.com>) escribi?:
>
> For symmetry with the Kconfig-based packages offering comprehensive
> targets like linux-update-defconfig, barebox-update-defconfig and so
> on, add a new top level update-defconfig target to run savedefconfig.
>
> Signed-off-by: Vivien Didelot <vivien.didelot@gmail.com>
> ---
>  Makefile | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>

FWIW, I like this. People who are not very familiar with kconfig-based
systems are easily confused about this.

/Thomas
