From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 10 Jun 2019 09:05:56 +0200
Subject: [Buildroot] [PATCH v3 1/1] mender-grubenv: new package
In-Reply-To: <20190606155215.117770-1-aduskett@gmail.com>
References: <20190606155215.117770-1-aduskett@gmail.com>
Message-ID: <CADHdJwAJM58Fy9Jcjr1obTmeKQiEGK96LDhyw8kg6RP1Kzr_XQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 6, 2019 at 5:52 PM <aduskett@gmail.com> wrote:
>
> From: Adam Duskett <Aduskett@gmail.com>
>
> Mender-grubenv contains the boot scripts and tools used by Mender to
> integrate with the Grub2 bootloader.
>
> The user must select the following Grub modules for this package:
> loadenv, hashsum, echo, halt, gcry_sha256, and test.
>
> Because this patch also includes a grub version of fw_printenv and fw_setenv,
> package/mender/Config.in must be changed as well at the same time, because if
> both uboot-tools and this package are selected, during startup, mender calls
> the uboot-tools version of fw_printenv and fails to start.
>
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Tested-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Mirza Krak <mirza.krak@northern.tech>

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
