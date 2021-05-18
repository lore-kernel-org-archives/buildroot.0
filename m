From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 May 2021 22:34:31 +0200
Subject: [Buildroot] [PATCH 1/2] package/qemu: bump version to 6.0.0
In-Reply-To: <20210507170102.1896972-1-aduskett@rivian.com>
References: <20210507170102.1896972-1-aduskett@rivian.com>
Message-ID: <5c30f5b8-04db-5994-cdde-5f16ac152f72@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 07/05/2021 19:01, Adam Duskett wrote:
> From: Adam Duskett <aduskett@gmail.com>
> 
> Other changes:
>   - Drop patch 0003-hw-usb-host-libusb.c-fix-build-with-kernel-5.0.patch as it
>     is part of 6.0.0.
>   - Rename 0004-meson-add-tests-option.patch to
>     0003-meson-add-tests-option.patch and refresh it for 6.0.0
> 
> Signed-off-by: Adam Duskett <aduskett@rivian.com>

 Applied to next, thanks.

 As Romain mentioned, it would be nice if you could (1) monitor the weekly tests
for failures, and (2) follow-up with support for the new config options.

 Regards,
 Arnout
