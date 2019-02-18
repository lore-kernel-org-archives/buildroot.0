From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Feb 2019 22:51:49 +0100
Subject: [Buildroot] [PATCH 1/1] python-xlib: bump to version 0.25
In-Reply-To: <20190218212315.13841-1-joseph.kogut@gmail.com>
References: <20190218212315.13841-1-joseph.kogut@gmail.com>
Message-ID: <20190218225149.0964f65c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 18 Feb 2019 13:23:15 -0800
Joseph Kogut <joseph.kogut@gmail.com> wrote:

> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  package/python-xlib/python-xlib.hash | 7 ++++---
>  package/python-xlib/python-xlib.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 5 deletions(-)

This commit breaks legal info:

>>> python-xlib 0.25 Collecting legal info
ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9
ERROR: got     : 06eb1c441443cf15ac84f309003f4c43c62246939d37c75fc3e056c2d34cd300
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
