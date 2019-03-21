From: Mirza Krak <mirza.krak@northern.tech>
Date: Thu, 21 Mar 2019 20:26:34 +0100
Subject: [Buildroot] [PATCH v2 1/1] mender-grubenv: new package
In-Reply-To: <20190320183022.19052-1-aduskett@gmail.com>
References: <20190320183022.19052-1-aduskett@gmail.com>
Message-ID: <CADHdJwD+_yS3dkX4Jn-qcnem=9EQfsEyZPYyjsyuKvFTZboG3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 20, 2019 at 7:30 PM <aduskett@gmail.com> wrote:
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

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
