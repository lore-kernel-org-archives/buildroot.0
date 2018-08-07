From: Jagan Teki <jagan@amarulasolutions.com>
Date: Tue, 7 Aug 2018 11:33:57 +0530
Subject: [Buildroot] [PATCH v4 1/2] board: amarula: Add A64-Relic support
In-Reply-To: <20180701140026.2261-1-jagan@amarulasolutions.com>
References: <20180701140026.2261-1-jagan@amarulasolutions.com>
Message-ID: <CAMty3ZCa0x9K9mEYAL_Yz4gkZMNsNO8n8zkhUxSvuuFEe17F6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 1, 2018 at 7:30 PM, Jagan Teki <jagannadh.teki@gmail.com> wrote:
> Add initial support for Amarula A64-Relic board
> with below features:
> - U-Boot 2018.07-rc1
> - Linux 4.17.0-rc6
> - Default packages from buildroot
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v4:
> - remove sdcard.img image creation
> - on readme 'cd output/images' not output/images
> - add 'sudo' for fastboot commands on readme.txt
> Changes for v3:
> - Use 4.17 kernel headers
> - Add wiki link
> - Add BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
> - Update comments on readme.txt suggested by Thomas
> Changes for v2:
> - Use mainline U-Boot
> - Drop uboot.fragment since the UMS used for developement,
>   so note it on readme.txt how to use.
> - format the 'Write eMMC' steps suggested by Arnout.
> - fix fastboot steps in readme.txt
> - add offset in genimage.cfg for boot partition instead of size

Any further comments on this?
