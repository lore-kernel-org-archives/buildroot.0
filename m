From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Wed, 17 Oct 2018 11:52:37 -0300 (BRT)
Subject: [Buildroot] [PATCH] {linux,
 linux-headers}: fix linux-4.9.133.tar.xz checksum
In-Reply-To: <20181017135519.12202-1-antoine.tenart@bootlin.com>
References: <20181017135519.12202-1-antoine.tenart@bootlin.com>
Message-ID: <91763717.3534388.1539787957671.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

----- Original Message -----
> From: "Antoine Tenart" <antoine.tenart@bootlin.com>
> To: "buildroot" <buildroot@buildroot.org>
> Sent: Wednesday, October 17, 2018 10:55:19 AM
> Subject: [Buildroot] [PATCH] {linux, linux-headers}: fix linux-4.9.133.tar.xz checksum

> The Linux tarball checksum was recently updated, including the one for
> version 4.9.133. The checksum for this particular version of Linux
> misses one character which lead to a build issue as the checksum does
> not match:
> 
> ERROR: linux-4.9.133.tar.xz has wrong sha256 hash:
> ERROR: expected: 3730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563
> ERROR: got     :
> 53730fc025ba330a6f4908a6a1e4cb86d821000c84167721680ccf1b37b26563
> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> This patch fixes it.
> 
> Fixes: 0064c7b25125 ("{linux, linux-headers}: bump 4.{4, 9, 14, 18}.x series")

Fixes:
  https://gitlab.com/buildroot.org/buildroot/-/jobs/108680088

> Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>

Tested-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>


Regards,
Ricardo
