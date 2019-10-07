From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Oct 2019 22:34:55 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbson: bump version to 1.9.5
In-Reply-To: <20191006124215.11788-1-bernd.kuhls@t-online.de>
References: <20191006124215.11788-1-bernd.kuhls@t-online.de>
Message-ID: <20191007223455.165298c3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  6 Oct 2019 14:42:15 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libbson/libbson.hash | 2 +-
>  package/libbson/libbson.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks. However, according to
https://github.com/mongodb/libbson/, it is no longer a project that is
maintained standalone, it is now integrated inside mongodb, so 1.9.5
seems to be the last version that libbson will ever have.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
