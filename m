From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Oct 2019 09:11:22 +0200
Subject: [Buildroot] [PATCH] package/libqmi: bump to version 1.24.0
In-Reply-To: <20191014084052.467808-1-aleksander@aleksander.es>
References: <20191014084052.467808-1-aleksander@aleksander.es>
Message-ID: <20191015091122.1fffd129@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 14 Oct 2019 10:40:52 +0200
Aleksander Morgado <aleksander@aleksander.es> wrote:

> Also drop the musl compat patch as it was already included upstream.
> 
> Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
> ---
>  ...1-musl-compat-canonicalize_file_name.patch | 61 -------------------
>  package/libqmi/libqmi.hash                    |  2 +-
>  package/libqmi/libqmi.mk                      |  4 +-
>  3 files changed, 2 insertions(+), 65 deletions(-)
>  delete mode 100644 package/libqmi/0001-musl-compat-canonicalize_file_name.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
