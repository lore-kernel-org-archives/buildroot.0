From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 28 May 2019 15:54:21 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-26
In-Reply-To: <20190527060054.C8BD222176@silver.osuosl.org>
References: <20190527060054.C8BD222176@silver.osuosl.org>
Message-ID: <20190528155421.GB2515@momiji>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, 27 May 2019 06:00:47 -0000, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
> 
> Build statistics for 2019-05-26
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2019.02.x |  10 |   0 |   1 |  11 |
>       master | 164 |  15 |   1 | 180 |
>         next |  48 |  20 |   0 |  68 |
> 
> Results for branch 'next'
> =========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                     dhcp-4.4.1 | 6 
>              iputils-s20190515 | 3 
>                       iwd-0.13 | 2 
>                       ell-0.20 | 1 
> libcamera-ab0188fc8bbb6f397... | 1 
>           libcdaudio-0.99.12p2 | 1 
>                   libssh-0.8.7 | 1 
> libubootenv-8a7d4030bcb106d... | 1 
>                 openzwave-v1.6 | 1 
>        python-matplotlib-3.0.3 | 1 
>                 qt5base-5.12.2 | 1 
>           wpebackend-fdo-1.0.1 | 1 

This failure should not appear anymore now that wpebackend-fdo has been
updated to version 1.2.0: it was caused by having the update to libwpe
version 1.2.0 before the one for wpebackend-fdo ? next time I do a group
of updates for WPE WebKit components I will make it explicit in the cover
letter which ones cannot be merged isolated.
 
Cheers,
?Adri?n
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190528/a17fde64/attachment.asc>
