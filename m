From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:46:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/fmt: bump version to 6.2.0
In-Reply-To: <20200410103943.1899361-1-bernd.kuhls@t-online.de>
References: <20200410103943.1899361-1-bernd.kuhls@t-online.de>
Message-ID: <20200410224629.30cd3024@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 12:39:43 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Added upstream commit to fix Kodi build error.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...g-of-unsigned-char-strings-in-printf.patch | 54 +++++++++++++++++++
>  package/fmt/fmt.hash                          |  2 +-
>  package/fmt/fmt.mk                            |  2 +-
>  3 files changed, 56 insertions(+), 2 deletions(-)
>  create mode 100644 package/fmt/0001-Fix-handling-of-unsigned-char-strings-in-printf.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
