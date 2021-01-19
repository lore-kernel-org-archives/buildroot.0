From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 Jan 2021 22:14:30 +0100
Subject: [Buildroot] [PATCH 1/1] package/libstrophe: bump to version
 0.10.1
In-Reply-To: <20210104101054.5392-1-jubalh@iodoru.org>
References: <20210104101054.5392-1-jubalh@iodoru.org>
Message-ID: <20210119221430.76bfaa9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Mon,  4 Jan 2021 11:10:54 +0100
Michael Vetter <jubalh@iodoru.org> wrote:

> Changes:
> * Fixed compilation error when LibreSSL is used
> * Fixed crash when NULL is provided as password
> 
> Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Thanks a lot for the patch, but it doesn't work here, I don't get the
same hash as you do for the download. Could you check this on your side
?

Here is what I get:

ERROR: libstrophe-0.10.1.tar.gz has wrong sha256 hash:
ERROR: expected: 4918c47029ecdea2deab4b0f9336ca4a8bb12c28b72b2cec397d98664b94c771
ERROR: got     : 5bf0bbc555cb6059008f1b748370d4d2ee1e1fabd3eeab68475263556405ba39
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
