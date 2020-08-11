From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Aug 2020 23:50:10 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/htop: add patch for fixing
 build with gcc 10
In-Reply-To: <20200810045756.11462-1-fido_max@inbox.ru>
References: <20200810045756.11462-1-fido_max@inbox.ru>
Message-ID: <20200811235010.5c27da17@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 10 Aug 2020 07:57:56 +0300
Maxim Kochetkov <fido_max@inbox.ru> wrote:

> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
> ---
>  ...ve-complation-issues-with-fno-common.patch | 173 ++++++++++++++++++
>  1 file changed, 173 insertions(+)
>  create mode 100644 package/htop/0002-Resolve-complation-issues-with-fno-common.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
