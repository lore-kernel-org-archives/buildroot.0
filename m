From: Lothar Felten <lothar.felten@gmail.com>
Date: Wed, 17 May 2017 22:11:18 +0200
Subject: [Buildroot] ti-sgx-km package status
In-Reply-To: <a9b7d13527c841eab3207f1743c32434@DBXPR90MB0160.MGDPHG.emi.philips.com>
References: <a9b7d13527c841eab3207f1743c32434@DBXPR90MB0160.MGDPHG.emi.philips.com>
Message-ID: <0111321a-5349-d92c-aba2-134f897d5f77@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tim,

the TI SDK > 03.x ships with SGX binaries for newer kernels depending on 
wayland and some additional libs.

Older TI SDKs use Qt5 on eglfs, that's what the beaglebone_qt5_defconfig 
provides at the moment: qt5/eglfs.
These binaries won't work with a newer kernel.

Current status: it compiles, but I still need to work on qt5. Some of 
the build steps need fixes and a clean up for patches. An additional 
ti-sgx package is required too.

Best regards,
Lothar

On 17.05.2017 17:32, Harron, Tim wrote:
> Hi Lothar,
>
>
>
> I was told you were working on a fix for a problem with the ti-sgx-km in
> TI kernels > 4.1 (per https://bugs.busybox.net/show_bug.cgi?id=9781).
>
>
>
> Would you please let me know the status of this effort? Are the patches
> in a usable state?
>
>
>
> Thanks!
>
>
>
> -Tim
>
>
> ------------------------------------------------------------------------
> The information contained in this message may be confidential and
> legally protected under applicable law. The message is intended solely
> for the addressee(s). If you are not the intended recipient, you are
> hereby notified that any use, forwarding, dissemination, or reproduction
> of this message is strictly prohibited and may be unlawful. If you are
> not the intended recipient, please contact the sender by return e-mail
> and destroy all copies of the original message.
