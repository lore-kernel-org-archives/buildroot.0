From: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>
Date: Tue, 6 Feb 2018 10:28:36 -0600
Subject: [Buildroot] [PATCH] uboot: add option customizing the name of
 environment image
In-Reply-To: <20171218145557.19360-1-didin@synopsys.com>
References: <20171218145557.19360-1-didin@synopsys.com>
Message-ID: <CAKGmAFpo9g_J6r5MJ=yqprwM75cXVA+ft4mpQdhR943WaOSeCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Evgeniy,

On Mon, Dec 18, 2017 at 8:55 AM, Evgeniy Didin
<Evgeniy.Didin@synopsys.com> wrote:
> Historically, in buildroot the name of binary environment image
> file is "uboot-env.bin". But in upstream u-boot default name
> for this file is "uboot.env":
>
> http://git.denx.de/?p=u-boot.git;a=blob;f=env/Kconfig#l394
>
> For some boards U-Boot environment is stored in FAT partition, not as
> a raw blob on SD-card, so the name of environment file must be correct.
> For customizing name of envimage file option BR2_TARGET_UBOOT_ENVIMAGE_FILENAME
> has been added. For backward compatibility by default value of this
> option is set to "uboot-env.bin".
>
> Signed-off-by: Evgeniy Didin <didin@synopsys.com>

Reviewed-by: Bryce Ferguson <bryce.ferguson@rockwellcollins.com>

-- 


Bryce Ferguson
Software Engineer
Airborne Information Solutions \ RC Linux Platform

400 Collins Rd NE Cedar Rapids, Iowa 52498

Bryce.Ferguson at rockwellcollins.com
