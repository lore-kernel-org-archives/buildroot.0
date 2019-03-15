From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:44:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/xenomai: bump to version 3.0.8
In-Reply-To: <20190315123213.23652-1-norbert.lange@andritz.com>
References: <20190315123213.23652-1-norbert.lange@andritz.com>
Message-ID: <20190315214446.699a5e4d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 15 Mar 2019 13:32:13 +0100
Norbert Lange <nolange79@gmail.com> wrote:

> remove upstream patch.
> 
> Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
> ---
>  ...ated-destination-buffer-with-strncpy.patch | 91 -------------------
>  package/xenomai/xenomai.hash                  |  3 +-
>  package/xenomai/xenomai.mk                    |  2 +-
>  3 files changed, 3 insertions(+), 93 deletions(-)
>  delete mode 100644 package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
