From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:16:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/libnspr: bump to version 4.23
In-Reply-To: <20191021143045.92888-1-giulio.benetti@benettiengineering.com>
References: <20191021143045.92888-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191021191638.31c91f18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Oct 2019 16:30:44 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnspr/libnspr.hash | 2 +-
>  package/libnspr/libnspr.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks. Does the bump of libnss for security reasons
requires the bump of libnspr ? This is quite important for the LTS
branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
