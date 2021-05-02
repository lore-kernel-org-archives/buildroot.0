From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 2 May 2021 12:41:15 +0200
Subject: [Buildroot] [PATCH v4 04/10] configs/aarch64_efi_defconfig:
 build the EDK2 firmware from source
In-Reply-To: <Oza7o8F2CNJZdTMIHIxcX4vg10BiNjLDXcKEmSrPrY@cp3-web-033.plabs.ch>
References: <Oza7o8F2CNJZdTMIHIxcX4vg10BiNjLDXcKEmSrPrY@cp3-web-033.plabs.ch>
Message-ID: <CAK4VdL2jmpx-25QVBt5b3RKO6jipW6bwGAAZ7K0ebx8kL2ntQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 18, 2021 at 4:43 PM Dick Olsson <hi@senzilla.io> wrote:
> +       -drive file=output/images/QEMU_EFI_RESIZED.fd,if=pflash,format=raw \
> +       -drive file=output/images/QEMU_VARS_RESIZED.fd,if=pflash,format=raw \

These _RESIZED suffixes should be dropped with the new solution with truncate.
