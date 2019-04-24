From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 24 Apr 2019 22:17:45 +0200
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 6.0.0
In-Reply-To: <1556098636-18860-1-git-send-email-angelo@amarulasolutions.com>
References: <1556098636-18860-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190424221745.181ecbb0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Wed, 24 Apr 2019 11:37:16 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This patch bumps python-pillow to version 6.0.0.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  package/python-pillow/python-pillow.hash | 4 ++--
>  package/python-pillow/python-pillow.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

This patch breaks legal-info for this package:

ERROR: LICENSE has wrong sha256 hash:
ERROR: expected: 4960fc18becc286be839c8ff17bd70cd5222533f761129142153443718a25199
ERROR: got     : 64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
make[1]: *** [package/python-pillow/python-pillow.mk:75: python-pillow-legal-info] Error 1

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
