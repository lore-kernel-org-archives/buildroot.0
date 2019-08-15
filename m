From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Aug 2019 14:38:50 +0200
Subject: [Buildroot] [PATCH] package/micropython: bump version to 1.11
In-Reply-To: <20190815081816.4872-1-judge.packham@gmail.com>
References: <20190815081816.4872-1-judge.packham@gmail.com>
Message-ID: <20190815143850.0cac7cef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 15 Aug 2019 20:18:16 +1200
Chris Packham <judge.packham@gmail.com> wrote:

> Bring in the latest version and remove patch that has been applied upstream.
> 
> Signed-off-by: Chris Packham <judge.packham@gmail.com>
> ---
>  ..._vsnprintf-alias-for-gcc-9-and-above.patch | 32 -------------------
>  package/micropython/micropython.hash          |  2 +-
>  package/micropython/micropython.mk            |  2 +-
>  3 files changed, 2 insertions(+), 34 deletions(-)
>  delete mode 100644 package/micropython/0002-lib-utils-printf-Exclude-__GI_vsnprintf-alias-for-gcc-9-and-above.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
