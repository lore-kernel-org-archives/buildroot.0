From: Asaf Kahlon <asafka7@gmail.com>
Date: Sun, 19 Jul 2020 21:23:42 +0300
Subject: [Buildroot] [RFC] Buildroot running on the NVIDIA Tegra TX2
 devkit
In-Reply-To: <CA+h8R2qEcwbkWAT_deTkAKHdqPpvraskuOr3bnTvsYFu9YZY6A@mail.gmail.com>
References: <CA+h8R2qEcwbkWAT_deTkAKHdqPpvraskuOr3bnTvsYFu9YZY6A@mail.gmail.com>
Message-ID: <CALFsTFWLXgaHSSQg5AMb0j2dTvVGatwSLP2PHqa68-2W4q_9eA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jul 18, 2020 at 9:31 AM Christian Stewart <christian@paral.in> wrote:
>
> Hi all,
>
> I spent some time and managed to get Buildroot to run on the NVIDIA
> Tegra TX2 via my SkiffOS project, which simply combines together
> different configuration fragments.
>
> There is a buildroot package added as an extension which downloads
> Linux4Tegra and marks the licenses correctly (I hope).
>
> The system can be flashed by booting it into recovery mode (holding
> the REC button while starting) and running the "flash_usb.sh" script,
> which calls into T4L's flash.sh script, pointed to the Buildroot
> images output directory.
>
> The kernel, u-boot, and rootfs (as ext4) are flashed, and the
> opportunity for custom kernel arguments or boot-up behavior is there
> as well.
>
> RFC, if there's interest I can format into a Buildroot mainline defconfig.
This work seems very nice!
I also have interest in the Nvidia Jetson series, so If you want to
create a mainline defconfig in Buildroot I'll be more than happy to
review and help you maintain it.

>
> Stable commit link:
>
> https://github.com/paralin/SkiffOS/commit/6dc2b3f249e5d76018271ae00cff5029ff15b7da
>
> Best regards,
> Christian Stewart
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
Best regards,
Asaf.
